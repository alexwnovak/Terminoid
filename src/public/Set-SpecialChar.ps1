function Set-SpecialChar {
    [CmdletBinding( SupportsShouldProcess )]
    param (
        [Parameter( Mandatory )]
        [ValidateSet( 'BarJoiner' )]
        $Type,

        [Parameter( Mandatory )]
        $Char
    )

    if ( $PSCmdlet.ShouldProcess( "Setting $Type to $Char" ) ) {
        $script:SpecialCharTable[$Type] = $Char
    }
}
