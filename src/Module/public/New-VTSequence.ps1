function New-VTSequence {
    param (
        $Text,
        $Color,

        [switch]
        $Foreground
    )

    $prefix = if ( $Color -is [ConsoleColor] ) {
        GetAsConsoleColor $Color Foreground
    }
    elseif ( [Enum]::GetNames( [ConsoleColor] ) -contains $Color ) {
        $consoleColor = $Color -as [ConsoleColor]
        GetAsConsoleColor $consoleColor Foreground
    }
    elseif ( $Color -is [Array] ) {
        GetAsRgbArray $Color Foreground
    } #else {
    #     Write-Host "Can't tell $Color $($Color.GetType())"
    # }

    "$prefix$Text$EscPostfix"

    # $prefix = "$Esc`[0;m"
    # "$prefix$InputObject$postfix"
}
