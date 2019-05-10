function Reset-SpecialChar {
    param (
        [Parameter( Mandatory )]
        [ValidateSet( 'BarJoiner' )]
        $Type
    )

    $script:SpecialCharTable[$Type] = $script:DefaultSpecialCharTable[$Type]
}
