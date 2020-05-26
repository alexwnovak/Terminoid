Given 'I have a date from a few seconds ago' {
    $script:Date = (Get-Date).AddSeconds(-5)
}

Given 'I have a date from a minute and a half ago' {
    $script:Date = (Get-Date).AddSeconds(-90)
}

When 'I format the date' {
    $script:FormattedDate = Format-Date -Date $script:Date
}

Then "it should read '(.*)'" {
    param ($Actual)

    $script:FormattedDate | Should -Be $Actual
}
