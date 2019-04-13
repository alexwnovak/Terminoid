function Set-DefaultFileDetailReader {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute( 'PSUseShouldProcessForStateChangingFunctions', '' )]
    param (
        [scriptblock]
        $Function
    )

    $script:DefaultDetailReader = $Function
}
