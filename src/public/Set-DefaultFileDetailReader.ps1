function Set-DefaultFileDetailReader {
    [CmdletBinding( SupportsShouldProcess )]
    param (
        [scriptblock]
        $Function
    )

    if ( $PSCmdlet.ShouldProcess( 'Changing the default file detail reader' ) ) {
        $script:DefaultDetailReader = $Function
    }
}
