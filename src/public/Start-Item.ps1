function Start-Item {
    param (
        $ItemName
    )

    foreach ( $handler in $script:StartHandlerTable ) {
        if ( & $handler.Predicate $ItemName ) {
            & $handler.Function $ItemName
            return
        }
    }

    & $script:DefaultStartHandler $ItemName
}
