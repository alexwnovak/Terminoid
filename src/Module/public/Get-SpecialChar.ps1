function Get-SpecialChar {
    param (
        [Parameter( Mandatory )]
        [ValidateSet( 'BarJoiner' )]
        $Type
    )

    $script:SpecialCharTable[$Type]
}
