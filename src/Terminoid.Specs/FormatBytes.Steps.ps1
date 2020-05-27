Given 'I have a size of (.*) bytes' {
    param ($Bytes)
    $script:Size = $Bytes
}

When 'I format the size' {
    $script:FormattedSize = Format-Bytes -Size $script:Size
}

When 'I format the size with (.*) decimal places' {
    param ($Places)
    $script:FormattedSize = Format-Bytes -Size $script:Size -Places $Places
}

When 'I pass the size as a positional argument' {
    $script:FormattedSize = Format-Bytes $script:Size
}

When 'I pipe the size to the formatter' {
    $script:FormattedSize = $script:Size | Format-Bytes
}

Then "the formatted size should read '(.*)'" {
    param ($Actual)
    $script:FormattedSize | Should -Be $Actual
}
