Given 'I have a date from (.*) seconds ago' {
    param ($Seconds)
    $script:Date = (Get-Date).AddSeconds(-$Seconds)
}

Given 'I have a date from (.*) minutes ago' {
    param ($Minutes)
    $script:Date = (Get-Date).AddMinutes(-$Minutes)
}

Given 'I have a date from (.*) hours ago' {
    param ($Hours)
    $script:Date = (Get-Date).AddHours(-$Hours)
}

Given 'I have a date from (.*) days ago' {
    param ($Days)
    $script:Date = (Get-Date).AddDays(-$Days)
}

Given 'I have a date from (.*) years ago' {
    param ($Years)
    $script:Date = (Get-Date).AddYears(-$Years)
}

When 'I format the date' {
    $script:FormattedDate = Format-Date -Date $script:Date
}

When 'I pass the date via positional argument' {
    $script:FormattedDate = Format-Date $script:Date
}

When 'I pipe the date to the formatter' {
    $script:FormattedDate = $script:Date | Format-Date
}

Then "it should read '(.*)'" {
    param ($Actual)
    $script:FormattedDate | Should -Be $Actual
}
