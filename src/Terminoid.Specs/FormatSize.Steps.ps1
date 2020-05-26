Given 'I have a size of (.*) bytes' {
    param ($Bytes)
    $script:Size = $Bytes
}

When 'I format the size' {
    $script:FormattedSize = Format-Size -Size $script:Size
}

When 'I pass the size as a positional argument' {
    $script:FormattedSize = Format-Size $script:Size
}

When 'I pipe the size to the formatter' {
    $script:FormattedSize = $script:Size | Format-Size
}

Then "the formatted size should read '(.*)'" {
    param ($Actual)
    $script:FormattedSize | Should -Be $Actual
}
