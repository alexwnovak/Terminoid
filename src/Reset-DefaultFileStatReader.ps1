function Reset-DefaultFileStatReader {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute( 'PSUseShouldProcessForStateChangingFunctions', '' )]
    param ()

    $script:DefaultStatReader = $function:DefaultFileStatReader
}
