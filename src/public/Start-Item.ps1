function Start-Item {
    [CmdletBinding( SupportsShouldProcess )]
    param (
        $Item
    )

    foreach ( $handler in $script:StartHandlerTable ) {
        if ( & $handler.Predicate $Item ) {
            if ( $PSCmdlet.ShouldProcess( 'Starting item with custom handler' ) ) {
                & $handler.Function $Item
                return
            }
        }
    }

    if ( $PSCmdlet.ShouldProcess( 'Starting item with default handler' ) ) {
        & $script:DefaultStartHandler $Item
    }
}
