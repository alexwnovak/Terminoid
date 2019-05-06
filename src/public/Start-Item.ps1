function Start-Item {
    param (
        $ItemName
    )

    & $script:DefaultStartHandler $ItemName
}
