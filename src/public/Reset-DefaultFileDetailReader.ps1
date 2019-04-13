function Reset-DefaultFileDetailReader {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute( 'PSUseShouldProcessForStateChangingFunctions', '' )]
    param ()

    $script:DefaultDetailReader = $function:DefaultFileDetailReader
}
