function Set-DefaultFileStatReader {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute( 'PSUseShouldProcessForStateChangingFunctions', '' )]
    param (
        [scriptblock]
        $Function
    )

    $script:DefaultStatReader = $Function
}
