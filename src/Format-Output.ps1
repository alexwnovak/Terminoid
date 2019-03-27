$ConsoleColorTable = @{
    [ConsoleColor]::Black = 30;
    [ConsoleColor]::DarkBlue = 34;
    [ConsoleColor]::DarkGreen = 32;
    [ConsoleColor]::DarkCyan = 36;
    [ConsoleColor]::DarkRed = 31;
    [ConsoleColor]::DarkMagenta = 35;
    [ConsoleColor]::DarkYellow = 33;
    [ConsoleColor]::Gray = 37;
}

$ForegroundFlag = 38
$BackgroundFlag = 48
$ItalicFlag = 3
$UnderlineFlag = 4

function GetAnsiForegroundColor( $ConsoleColor ) {
    $foregroundInt = [int] $ConsoleColor

    if ( $foregroundInt -ge 8 ) {
        $ConsoleColor = [ConsoleColor] ($foregroundInt - 8)
        $ConsoleColorTable[$ConsoleColor] + 60
    } else {
        $ConsoleColorTable[$ConsoleColor]
    }
}

function GetAnsiBackgroundColor( $ConsoleColor ) {
    $backgroundInt = [int] $ConsoleColor

    if ( $backgroundInt -ge 8 ) {
        $ConsoleColor = [ConsoleColor] ($backgroundInt - 8)
        $ConsoleColorTable[$ConsoleColor] + 70
    } else {
        $ConsoleColorTable[$ConsoleColor] + 10
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
            $modifiers += GetAnsiForegroundColor ($Foreground -as [ConsoleColor])
        }

        if ( $null -ne ($Background -as [byte[]]) ) {
            $modifiers += GetAsRgbArray $BackgroundFlag $Background
        } elseif ( $null -ne ($Background -as [ConsoleColor]) ) {
            $modifiers += GetAnsiBackgroundColor ($Background -as [ConsoleColor])
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
