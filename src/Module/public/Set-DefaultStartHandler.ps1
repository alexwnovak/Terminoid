function DefaultStartHandler( $ItemName, $Wait ) {
    Start-Process $ItemName -Wait:$Wait
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
