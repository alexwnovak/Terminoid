Given 'I have a date from a few seconds ago' {
    $script:Date = (Get-Date).AddSeconds(-5)
}

When 'I format the date' {
    $script:FormattedDate = Format-Date -Date $script:Date
}

Then "it should read 'just now'" {
    $script:FormattedDate | Should -Be 'just now'
}
