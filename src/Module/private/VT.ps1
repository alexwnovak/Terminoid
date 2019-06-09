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

function New-VTSequence {
    param (
        $Text,
        $Color,

        [switch]
        $Foreground
    )

    $prefix = ''

    if ( $Color -is [ConsoleColor] ) {
        $prefix = GetAsConsoleColor $Color Foreground
    } elseif ( [Enum]::GetNames( [ConsoleColor] ) -contains $Color ) {
        $consoleColor = $Color -as [ConsoleColor]
        $prefix = GetAsConsoleColor $consoleColor Foreground
    } # elseif ( $Color -is [Array] ) {
    #     Write-Host "Got array $Color of type $($Color.GetType())"
    # } else {
    #     Write-Host "Can't tell $Color $($Color.GetType())"
    # }

    "$prefix$Text$EscPostfix"

    # $prefix = "$Esc`[0;m"
    # "$prefix$InputObject$postfix"
    

}
