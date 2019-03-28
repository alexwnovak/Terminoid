$ConsoleColorToAnsiTable = @(
    0,   # Black
    4,   # Blue
    2,   # Green
    6,   # Cyan
    1,   # Red
    5,   # Magenta
    3,   # Yellow
    7    # Gray
)

$ForegroundFlag = 38
$BackgroundFlag = 48
$ItalicFlag = 3
$UnderlineFlag = 4

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
    } else {
        $ConsoleColorToAnsiTable[$colorIndex] + $indexModifier
    }
}

function GetAsRgbArray( $SetterFlag, $Rgb ) {
    $Rgb = $Rgb -as [byte[]]

    if ( $Rgb.Length -ne 3 ) {
        throw 'An RGB color array must have 3 elements between 0 and 255'
    }

    @($SetterFlag, 2, $Rgb[0], $Rgb[1], $Rgb[2])
}

function Format-Output {
    param (
        [Parameter( ValueFromPipeline )]
        $InputObject,

        $Foreground,
        $Background,

        [switch]
        $Italic,

        [switch]
        $Underline
    )

    begin {
        $e = [char]0x1B
        $modifiers = @()
        $postfix = "$e`[0m"

        if ( $Italic ) {
            $modifiers += $ItalicFlag
        }

        if ( $Underline ) {
            $modifiers += $UnderlineFlag
        }

        if ( $null -ne ($Foreground -as [byte[]]) ) {
            $modifiers += GetAsRgbArray $ForegroundFlag $Foreground
        } elseif ( $null -ne ($Foreground -as [ConsoleColor]) ) {
            $modifiers += GetAsConsoleColor -ColorType Foreground -ColorName $Foreground
        }

        if ( $null -ne ($Background -as [byte[]]) ) {
            $modifiers += GetAsRgbArray $BackgroundFlag $Background
        } elseif ( $null -ne ($Background -as [ConsoleColor]) ) {
            $modifiers += GetAsConsoleColor -ColorType Background -ColorName $Background
        }
    }

    process {
        if ( !$modifiers ) {
            $InputObject
            return
        }

        $prefix = "$e`[0;$($modifiers -Join ';')m"
        "$prefix$InputObject$postfix"
    }
}
