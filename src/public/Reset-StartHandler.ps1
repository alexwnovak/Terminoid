function Reset-StartHandler {
    [CmdletBinding( SupportsShouldProcess )]
    param ()

    if ( $PSCmdlet.ShouldProcess( 'Resetting custom start handlers' ) ) {
        [System.Collections.ArrayList] $script:StartHandlerTable = @()
    }
}
