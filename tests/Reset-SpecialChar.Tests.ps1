. $PSScriptRoot\Shared.ps1

Describe 'Reset-SpecialChar' {
    It 'resets the bar joiner to its default value' {
        Set-SpecialChar -Type BarJoiner -Char 'something else'
        Reset-SpecialChar -Type BarJoiner
        Get-SpecialChar -Type BarJoiner | Should -Be $([char]0xE0B0)
    }
}