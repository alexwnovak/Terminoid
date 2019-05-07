function DefaultStartHandler( $ItemName ) {
    Start-Process -FilePath $ItemName
}

function Set-DefaultStartHandler {
    [CmdletBinding( SupportsShouldProcess )]
    param (
        [scriptblock]
        $Function
    )

    if ( $PSCmdlet.ShouldProcess( 'Setting the default start handler' ) ) {
        $script:DefaultStartHandler = $Function
    }
}
