$Esc = [char]0x1B
$EscPrefix = "$Esc`[0;"
$EscPostfix = "$Esc`[0m"

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

    "$EscPrefix$($colorValue)m"
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

    "$($EscPrefix)$($modifier);2;$($Rgb[0]);$($Rgb[1]);$($Rgb[2])m"
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

function New-VTSequence {
    param (
        [Parameter( Mandatory )]
        $Text,

        $Foreground,
        $Background
    )

    if ( $PSBoundParameters.Count -eq 1 ) {
        return $Text
    }

    if ( $PSBoundParameters.ContainsKey( 'Foreground' ) -and $null -ne $Foreground ) {
        $prefix = if ( $Foreground -is [ConsoleColor] ) {
            GetAsConsoleColor $Foreground Foreground
        } elseif ( [Enum]::GetNames( [ConsoleColor] ) -contains $Foreground ) {
            $consoleColor = $Foreground -as [ConsoleColor]
            GetAsConsoleColor $consoleColor Foreground
        } elseif ( $Foreground -is [Array] ) {
            GetAsRgbArray $Foreground Foreground
        } elseif ( IsHexColor $Foreground ) {
            GetAsHex $Foreground Foreground
        } else {
            throw "Unable to parse foreground into a ConsoleColor, RGB triplet, or hex color: $Foreground"
        }

        "$prefix$Text$EscPostfix"
    }

    if ( $PSBoundParameters.ContainsKey( 'Background' ) -and $null -ne $Background ) {
        $prefix = if ( $Background -is [ConsoleColor] ) {
            GetAsConsoleColor $Background Background
        }
        elseif ( [Enum]::GetNames( [ConsoleColor] ) -contains $Background ) {
            $consoleColor = $Background -as [ConsoleColor]
            GetAsConsoleColor $consoleColor Background
        }
        elseif ( $Background -is [Array] ) {
            GetAsRgbArray $Background Background
        }
        elseif ( IsHexColor $Background ) {
            GetAsHex $Background Background
        }
        else {
            throw "Unable to parse background into a ConsoleColor, RGB triplet, or hex color: $Background"
        }

        "$prefix$Text$EscPostfix"
    }
}
