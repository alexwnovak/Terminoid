function Start-Item {
    param (
        $Item
    )

    foreach ( $handler in $script:StartHandlerTable ) {
        if ( & $handler.Predicate $Item ) {
            & $handler.Function $Item
            return
        }
    }

    & $script:DefaultStartHandler $Item
}
