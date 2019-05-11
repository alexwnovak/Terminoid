function Reset-DefaultFileDetailReader {
    [CmdletBinding( SupportsShouldProcess )]
    param ()

    if ( $PSCmdlet.ShouldProcess( 'Resetting the default file detail reader' ) ) {
        $script:DefaultDetailReader = $function:DefaultFileDetailReader
    }
}
