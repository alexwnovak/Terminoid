function Set-SpecialChar {
    param (
        [Parameter( Mandatory )]
        [ValidateSet( 'BarJoiner' )]
        $Type,

        [Parameter( Mandatory )]
        $Char
    )

    $script:SpecialCharTable[$Type] = $Char
}
