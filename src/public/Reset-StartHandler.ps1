function Reset-StartHandler {
    [CmdletBinding( SupportsShouldProcess )]
    param ()

    if ( $PSCmdlet.ShouldProcess( 'Resetting custom start handlers' ) ) {
        $script:StartHandlerTable = [List[Hashtable]]::new()
    }
}
