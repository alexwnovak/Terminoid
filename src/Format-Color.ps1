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
        $InputObject,
        $Foreground,
        $Background
    )

    if ( !$PSBoundParameters.ContainsKey( 'Foreground' ) -and !$PSBoundParameters.ContainsKey( 'Background' ) ) {
        $InputObject
        return
    }

    $e = [char]0x1B

    if ( $null -ne ($Foreground -as [ConsoleColor]) ) {
        $Foreground = GetAnsiForegroundColor ($Foreground -as [ConsoleColor])
    }

    if ( $null -ne ($Background -as [ConsoleColor]) ) {
        $Background = GetAnsiBackgroundColor ($Background -as [ConsoleColor])
    }

    if ( $Foreground -and $Background ) {
        $color = "$Foreground;$Background"
    } elseif ( $Foreground ) {
        $color = $Foreground
    } elseif ( $Background ) {
        $color = $Background
    }

    "$([char]0x1B)`[0;$($color)m$InputObject$([char]0x1B)`[0m"
}
