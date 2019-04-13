function Get-SpecialChar {
    param (
        $Type
    )

    $script:SpecialCharTable[$Type]
}
