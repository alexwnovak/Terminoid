$BoldFlag = 1
$ItalicFlag = 3
$UnderlineFlag = 4

$ForegroundOffset = 30
$BackgroundOffset = 40
$BrightOffset = 60

$ForegroundRgbSequence = 38
$BackgroundRgbSequence = 48

$ConsoleColorToVTTable = @(
    0,  # Black
    4,  # Blue
    2,  # Green
    6,  # Cyan
    1,  # Red
    5,  # Magenta
    3,  # Yellow
    7   # Gray
)

function GetBoldModifier {
    $BoldFlag
}

function GetItalicModifier {
    $ItalicFlag
}

function GetUnderlineModiifer {
    $UnderlineFlag
}

function GetAsConsoleColor {
    param (
        [ConsoleColor]
        $Color,

        [string]
        $ColorType
    )

    $indexModifier = switch ( $ColorType ) {
        'Foreground' { $ForegroundOffset }
        'Background' { $BackgroundOffset }
    }

    $colorIndex = [int] $Color

    if ( $colorIndex -ge 8 ) {
        $colorIndex = $colorIndex - 8
        $ConsoleColorToVTTable[$colorIndex] + $indexModifier + $BrightOffset
    } else {
        $ConsoleColorToVTTable[$colorIndex] + $indexModifier
    }
}

function GetAsRgbArray {
    param (
        [Array]
        $Rgb,

        [string]
        $ColorType
    )

    $modifier = switch ( $ColorType ) {
        'Foreground' { $ForegroundRgbSequence }
        'Background' { $BackgroundRgbSequence }
    }

    "$($modifier);2;$($Rgb[0]);$($Rgb[1]);$($Rgb[2])"
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
    }
}
