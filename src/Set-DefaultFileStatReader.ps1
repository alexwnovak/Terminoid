function Set-DefaultFileStatReader {
    param (
        [scriptblock]
        $Function
    )

    $global:DefaultStatReader = $Function
}
