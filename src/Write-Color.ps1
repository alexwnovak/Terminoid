function Write-Color {
    param (
        [Parameter( Mandatory, Position = 0 )]
        $Object,

        [switch]
        $NoNewline = $false,

        [byte[]]
        $Foreground,

        [byte[]]
        $Background
    )

    $e = [char]0x1B
    $output = ""

    $hasForeground = $PSBoundParameters.ContainsKey('Foreground')
    $hasBackground = $PSBoundParameters.ContainsKey('Background')

    if ( $hasForeground -or $hasBackground ) {
        $output += "$e`[0"

        if ( $hasForeground -and $hasBackground ) {
            $output += "38;2;$($Foreground[0]);$($Foreground[1]);$($Foreground[2]);"
            $output += "48;2;$($Background[0]);$($Background[1]);$($Background[2])m"
        }
        elseif ( $hasForeground ) {
            $output += "38;2;$($Foreground[0]);$($Foreground[1]);$($Foreground[2])m"
        }
        elseif ( $hasBackground ) {
            $output += "48;2;$($Background[0]);$($Background[1]);$($Background[2])m"
        }
    }

    $output += $Object

    if ( $hasForeground -or $hasBackground ) {
        $output += "$e`[0m"
    }

    Write-Host $output -NoNewline:$NoNewline
}
