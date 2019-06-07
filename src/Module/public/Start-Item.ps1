function Start-Item {
    [CmdletBinding( SupportsShouldProcess )]
    param (
        $Item,

        [switch]
        $Wait = $false
    )

    foreach ( $handler in $script:StartHandlerTable ) {
        if ( & $handler.Predicate $Item ) {
            if ( $PSCmdlet.ShouldProcess( 'Starting item with custom handler' ) ) {
                & $handler.Function $Item $Wait
                return
            }
        }
    }

    if ( $PSCmdlet.ShouldProcess( 'Starting item with default handler' ) ) {
        & $script:DefaultStartHandler $Item $Wait
    }
}
