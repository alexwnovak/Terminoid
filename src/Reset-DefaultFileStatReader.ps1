function Reset-DefaultFileStatReader {
    $script:DefaultStatReader = $function:DefaultFileStatReader
}
