. $PSScriptRoot\Shared.ps1

Describe 'Format-Join' {
    It 'can join null' {
        Format-Join $null | Should -BeNullOrEmpty
    }

    It 'can join an empty array' {
        Format-Join @() | Should -BeNullOrEmpty
    }

    It 'can join a single item' {
        Format-Join 'one' | Should -Be 'one'
    }

    It 'can join multiple items' {
        Format-Join 1, 2, 3 | Should -Be '123'
    }
}