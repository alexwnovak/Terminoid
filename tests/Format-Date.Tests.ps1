. $PSScriptRoot\Shared.ps1

InModuleScope 'Terminoid' {
    Describe 'Format-Date' {
        $now = Get-Date

        It 'formats as "just now" if it was within the last minute' {
            Format-Date -Date $now.AddSeconds( -10 ) | Should -Be 'just now'
        }

        It 'formats as a singular "minute ago" if it was between one and two minutes ago' {
            Format-Date -Date $now.AddMinutes( -1.5 ) | Should -Be '1 minute ago'
        }

        It 'formats as "minutes ago" if it was within the last hour' {
            Format-Date -Date $now.AddMinutes( -30 )  | Should -Be '30 minutes ago'
        }

        It 'formats as a singular "hour ago" if it was between one and two hours ago' {
            Format-Date -Date $now.AddHours( -1.5 ) | Should -Be '1 hour ago'
        }

        It 'formats as "hours ago" if it was within the last day' {
            Format-Date -Date $now.AddHours( -12 ) | Should -Be '12 hours ago'
        }

        It 'formats as a singular "day ago" if it was between one and two days ago' {
            Format-Date -Date $now.AddDays( -1.5 ) | Should -Be '1 day ago'
        }

        It 'formats as "days ago" if it was within the last 30 days' {
            Format-Date -Date $now.AddDays( -25 ) | Should -Be '25 days ago'
        }

        It 'formats as a singular "month ago" if it was between one and two months ago' {
            Format-Date -Date $now.AddDays( -45 ) | Should -Be '1 month ago'
        }

        It 'formats as "months ago" if it was within the last year' {
            Format-Date -Date $now.AddDays( -185 ) | Should -Be '6 months ago'
        }

        It 'formats as a singular "year ago" if it was between one and two years ago' {
            Format-Date -Date $now.AddDays( -545 ) | Should -Be '1 year ago'
        }

        It 'formats as "years ago" if it was at least 2 years ago' {
            Format-Date -Date $now.AddDays( -800 ) | Should -Be '2 years ago'
        }
    }
}
