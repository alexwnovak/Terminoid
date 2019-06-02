. $PSScriptRoot\Shared.ps1

Describe 'Format-Size' {
    Context 'the size is less than a kilobyte' {
        It 'formats as bytes when less than a kilobyte' {
            Format-Size -Size 123 | Should -Be '123 B'
        }        
    }

    Context 'the size is should be measured in kilobytes' {
        It 'formats as kilobytes when less than a megabyte' {
            Format-Size -Size 123KB | Should -Be '123 KB'
        }

        It 'omits the decimal place when between 10 and 99 kilobytes' {
            Format-Size -Size 45.4KB | Should -Be '45 KB'
        }

        It 'uses one decimal place when less than 10 kilobytes' {
            Format-Size -Size 2.3KB | Should -Be '2.3 KB'
        }
    }

    Context 'the size should be measured in megabytes' {
        It 'formats as megabytes when less than a gigabyte' {
            Format-Size -Size 123MB | Should -Be '123 MB'
        }

        It 'uses one decimal place when less than 10 megabytes' {
            Format-Size -Size 2.3MB | Should -Be '2.3 MB'
        }

        It 'omits the decimal place when between 10 and 99 megabytes' {
            Format-Size -Size 45.4MB | Should -Be '45 MB'
        }
    }

    Context 'the size should be measured in gigabytes' {
        It 'formats as gigabytes when less than a terabyte' {
            Format-Size -Size 123GB | Should -Be '123 GB'
        }

        It 'uses one decimal place when less than 10 gigabytes' {
            Format-Size -Size 2.3GB | Should -Be '2.3 GB'
        }

        It 'omits the decimal place when between 10 and 99 gigabytes' {
            Format-Size -Size 45.4GB | Should -Be '45 GB'
        }
    }

    Context 'the size should be measured in terabytes' {
        It 'formats as terabytes when less than a petabyte' {
            Format-Size -Size 123TB | Should -Be '123 TB'
        }

        It 'uses one decimal place when less than 10 terabytes' {
            Format-Size -Size 2.3TB | Should -Be '2.3 TB'
        }

        It 'omits the decimal place when between 10 and 99 terabytes' {
            Format-Size -Size 45.4TB | Should -Be '45 TB'
        }
    }

    Context 'the size should be measured in petabytes' {
        It 'formats as petabytes when at least a petabyte' {
            Format-Size -Size 123PB | Should -Be '123 PB'
        }

        It 'uses one decimal place when less than 10 petabytes' {
            Format-Size -Size 2.3PB | Should -Be '2.3 PB'
        }

        It 'omits the decimal place when between 10 and 99 petabytes' {
            Format-Size -Size 45.4PB | Should -Be '45 PB'
        }
    }
}
