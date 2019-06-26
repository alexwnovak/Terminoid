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

    It 'can format hashtables with text properties' {
        $one = @{
            Text = 'a'
            Background = 'Blue'
        }

        $two = @{
            Text = 'b'
            Background = 'Red'
        }

        Format-Join $one, $two | Should -Be "$(Format-Output $one)$(Format-Output $two)"
    }

    It 'can format when mixing a hashtable with another object' {
        $table = @{
            Text = 'a'
            Background = 'Blue'
        }

        Format-Join $table, 'b' | Should -Be "$(Format-Output $table)b"
    }
}