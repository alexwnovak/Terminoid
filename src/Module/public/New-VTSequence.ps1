$Esc = [char]0x1B
$EscPrefix = "$Esc`[0"
$EscPostfix = "$Esc`[0m"

$BoldFlag = 1
$ItalicFlag = 3
$UnderlineFlag = 4

$ConsoleColorToVTTable = @(
    0, # Black
    4, # Blue
    2, # Green
    6, # Cyan
    1, # Red
    5, # Magenta
    3, # Yellow
    7  # Gray
)

function GetAsConsoleColor {
    param (
        [ConsoleColor]
        $Color,

        [string]
        $ColorType
    )

    $indexModifier = switch ( $ColorType ) {
        'Foreground' { 30 }
        'Background' { 40 }
    }

    $colorIndex = [int] $Color
    $colorValue = if ( $colorIndex -ge 8 ) {
        $colorIndex = $colorIndex - 8
        $ConsoleColorToVTTable[$colorIndex] + $indexModifier + 60
    } else {
        $ConsoleColorToVTTable[$colorIndex] + $indexModifier
    }

    $colorValue
}

function GetAsRgbArray {
    param (
        [Array]
        $Rgb,

        [string]
        $ColorType
    )

    $modifier = switch ( $ColorType ) {
        'Foreground' { 38 }
        'Background' { 48 }
    }

    if ( $Rgb.Length -ne 3 ) {
        throw 'An RGB color array must have 3 elements between 0 and 255'
    }

    if ( $Rgb[0] -lt 0 -or $Rgb[0] -gt 255 ) {
        throw "Red element found to be outside the 0-255 range: $($Rgb[0])"
    }

    if ( $Rgb[1] -lt 0 -or $Rgb[1] -gt 255 ) {
        throw "Green element found to be outside the 0-255 range: $($Rgb[1])"
    }

    if ( $Rgb[2] -lt 0 -or $Rgb[2] -gt 255 ) {
        throw "Blue element found to be outside the 0-255 range: $($Rgb[2])"
    }

    "$($modifier);2;$($Rgb[0]);$($Rgb[1]);$($Rgb[2])"
}

function IsHexColor( $Hex ) {
    $Hex -match '[0-9a-fA-F]{6}'
}

function GetAsHex( $Hex, $ColorType ) {
    $red = [byte] ('0x' + $Hex.Substring( 0, 2 ))
    $green = [byte] ('0x' + $Hex.Substring( 2, 2 ))
    $blue = [byte] ('0x' + $Hex.Substring( 4, 2 ))

    GetAsRgbArray $red, $green, $blue $ColorType
}

function ProcessColor( $Color, $ColorType ) {
    if ( $Color -is [ConsoleColor] ) {
        GetAsConsoleColor $Color $ColorType
    } elseif ( [Enum]::GetNames( [ConsoleColor] ) -contains $Color ) {
        $consoleColor = $Color -as [ConsoleColor]
        GetAsConsoleColor $consoleColor $ColorType
    } elseif ( $Color -is [Array] ) {
        GetAsRgbArray $Color $ColorType
    } elseif ( IsHexColor $Color ) {
        GetAsHex $Color $ColorType
    } else {
        throw "Unable to parse into a ConsoleColor, RGB triplet, or hex color: $Color"
    }
}

function New-VTSequence {
    param (
        [Parameter( Mandatory )]
        $Text,

        $Foreground,
        $Background,

        [switch]
        $Bold,

        [switch]
        $Italic,

        [switch]
        $Underline
    )

    if ( $PSBoundParameters.Count -eq 1 ) {
        return $Text
    }

    $modifiers = @()
    $modifiers += $EscPrefix

    if ( $Bold ) {
        $modifiers += $BoldFlag
    }

    if ( $Italic ) {
        $modifiers += $ItalicFlag
    }

    if ( $Underline ) {
        $modifiers += $UnderlineFlag
    }

    if ( $null -ne $Foreground ) {
        $modifiers += ProcessColor $Foreground Foreground
    }

    if ( $null -ne $Background ) {
        $modifiers += ProcessColor $Background Background
    }

    "$($modifiers -join ';')m$Text$EscPostfix"
}
