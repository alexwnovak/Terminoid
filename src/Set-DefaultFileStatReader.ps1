function Set-DefaultFileStatReader {
    param (
        [scriptblock]
        $Function
    )

    $script:DefaultStatReader = $Function
}
