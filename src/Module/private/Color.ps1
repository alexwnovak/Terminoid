$ConsoleColorToAnsiTable = @(
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
        [Parameter()]
        [ValidateSet( 'Foreground', 'Background' )]
        [string]
        $ColorType,

        $ColorName
    )

    $indexModifier = switch ( $ColorType ) {
        'Foreground' { 30 }
        'Background' { 40 }
    }

    $consoleColor = $ColorName -as [ConsoleColor]
    $colorIndex = [int] $consoleColor

    if ( $colorIndex -ge 8 ) {
        $colorIndex = $colorIndex - 8
        $ConsoleColorToAnsiTable[$colorIndex] + $indexModifier + 60
    }
    else {
        $ConsoleColorToAnsiTable[$colorIndex] + $indexModifier
    }
}

function GetAsRgbArray {
    param (
        [Parameter()]
        [ValidateSet( 'Foreground', 'Background' )]
        $ColorType,

        $Rgb
    )

    $modifier = switch ( $ColorType ) {
        'Foreground' { 38 }
        'Background' { 48 }
    }

    $Rgb = $Rgb -as [byte[]]

    if ( $Rgb.Length -ne 3 ) {
        throw 'An RGB color array must have 3 elements between 0 and 255'
    }

    @($modifier, 2, $Rgb[0], $Rgb[1], $Rgb[2])
}
