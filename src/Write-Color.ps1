function Write-Color {
    param (
        [Parameter( Mandatory, Position = 0 )]
        $Object,

        [switch]
        $NoNewline = $false,

        [byte[]]
        $Foreground
    )

    $hasForeground = $PSBoundParameters.ContainsKey('Foreground')

    if ( $hasForeground ) {
        Write-Host "$([char]0x1B)`[0m38;2;255;0;0m$Object$([char]0x1B)`[0m" -NoNewline:$NoNewline
    }
    else {
        Write-Host $Object -NoNewline:$NoNewline
    }
}
