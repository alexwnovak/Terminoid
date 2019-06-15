. $PSScriptRoot\Shared.ps1

Describe 'Reset-SpecialChar' {
    It 'resets the bar joiner to its default value' {
        Set-SpecialChar -Type BarJoiner -Char 'something else'
        Reset-SpecialChar -Type BarJoiner -Force
        Get-SpecialChar -Type BarJoiner | Should -Not -Be 'something else'
    }

    It 'can reset all characters at once' {
        Set-SpecialChar -Type BarJoiner -Char 'something else'
        Set-SpecialChar -Type SelectionIndicator -Char 'something else'

        Reset-SpecialChar -Force

        Get-SpecialChar -Type BarJoiner | Should -Not -Be 'something else'
        Get-SpecialChar -Type SelectionIndicator | Should -Not -Be 'something else'
    }
}
