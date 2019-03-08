function Write-Color {
    param (
        [Parameter( Mandatory, Position = 0 )]
        $Object,

        [switch]
        $NoNewline = $false
    )

    Write-Host $Object -NoNewline:$NoNewline
}
