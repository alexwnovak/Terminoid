. $PSScriptRoot\Shared.ps1

Describe 'Format-Size' {
    It 'formats as bytes when less than a kilobyte' {
        Format-Size -Size 100 | Should -Be '100 B'
    }

    It 'formats as kilobytes when less than a megabyte' {
        Format-Size -Size 100KB | Should -Be '100 KB'
    }

    It 'formats as megabytes when less than a gigabyte' {
        Format-Size -Size 100MB | Should -Be '100 MB'
    }

    It 'formats as gigabytes when less than a terabyte' {
        Format-Size -Size 100GB | Should -Be '100 GB'
    }

    It 'formats as terabytes when less than a petabyte' {
        Format-Size -Size 100TB | Should -Be '100 TB'
    }

    It 'formats as petabytes when at least a petabyte' {
        Format-Size -Size 1500PB | Should -Be '1500 PB'
    }
}
