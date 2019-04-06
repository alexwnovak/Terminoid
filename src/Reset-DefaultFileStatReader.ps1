function Reset-DefaultFileStatReader {
    $global:DefaultStatReader = $function:DefaultFileStatReader
}
