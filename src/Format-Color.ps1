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

function Format-Color {
    param (
        $Object,
        $Foreground,
        $Background
    )

    $e = [char]0x1B

    if ( $null -ne ($Foreground -as [ConsoleColor]) ) {
        $Foreground = $Foreground -as [ConsoleColor]

        $intensity = 0
        $foregroundInt = [int] $Foreground

        if ( $foregroundInt -ge 8 ) {
            $intensity = 1
            $Foreground = [ConsoleColor] ($foregroundInt - 8)
        }

        "$e`[$intensity;$($ConsoleColorTable[$Foreground])m$Object$e`[0m"
        return
    }

    if ( $null -ne ($Background -as [ConsoleColor]) ) {
        $Background = $Background -as [ConsoleColor]
        $backgroundInt = [int] $Background

        if ( $backgroundInt -ge 8 ) {
            $Background = [ConsoleColor] ($backgroundInt - 8)
            $backgroundInt = $ConsoleColorTable[$Background] + 70
        } else {
            $backgroundInt = $ConsoleColorTable[$Background] + 10
        }

        "$e`[0;$($backgroundInt)m$Object$e`[0m"
        return
    }

    $Object
}
