Given 'I have a size of (.*) bytes' {
    param ($Bytes)
    $script:Size = $Bytes
}

When 'I format the size' {
    $script:FormattedSize = Format-Size -Size $script:Size
}

Then "the formatted size should be '(.*)'" {
    param ($Actual)
    $script:FormattedSize | Should -Be $Actual
}
