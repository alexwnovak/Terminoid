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
    }
    else {
        $ConsoleColorTable[$ConsoleColor] + 10
    }

}

function Format-Color {
    param (
        $Object,
        $Foreground,
        $Background
    )

    $e = [char]0x1B

    if ( $null -ne ($Foreground -as [ConsoleColor]) ) {
        $foregroundInt = GetAnsiForegroundColor ($Foreground -as [ConsoleColor])

        "$e`[0;$($foregroundInt)m$Object$e`[0m"
        return
    }

    if ( $null -ne ($Background -as [ConsoleColor]) ) {
        $backgroundInt = GetAnsiBackgroundColor ($Background -as [ConsoleColor])

        "$e`[0;$($backgroundInt)m$Object$e`[0m"
        return
    }

    $Object
}
