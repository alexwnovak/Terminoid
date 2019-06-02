function Reset-SpecialChar {
    [CmdletBinding( SupportsShouldProcess )]
    param (
        [Parameter( Mandatory )]
        [ValidateSet( 'BarJoiner' )]
        $Type
    )

    if ( $PSCmdlet.ShouldProcess( "Resetting $Type to its default value" ) ) {
        $script:SpecialCharTable[$Type] = $script:DefaultSpecialCharTable[$Type]
    }
}
