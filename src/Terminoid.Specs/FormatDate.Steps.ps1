Given 'I have a date from a few seconds ago' {
    $script:Date = (Get-Date).AddSeconds(-5)
}

Given 'I have a date from a minute and a half ago' {
    $script:Date = (Get-Date).AddSeconds(-90)
}

Given 'I have a date from 30 minutes ago' {
    $script:Date = (Get-Date).AddMinutes(-30)
}

When 'I format the date' {
    $script:FormattedDate = Format-Date -Date $script:Date
}

Then "it should read '(.*)'" {
    param ($Actual)

    $script:FormattedDate | Should -Be $Actual
}
