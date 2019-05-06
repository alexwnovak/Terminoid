function DefaultStartHandler( $ItemName ) {
    Start-Process -FilePath $ItemName
}

function Set-DefaultStartHandler {
    param (
        [scriptblock]
        $Function
    )

    $script:DefaultStartHandler = $Function
}
