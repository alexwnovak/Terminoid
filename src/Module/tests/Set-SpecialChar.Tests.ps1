. $PSScriptRoot\Shared.ps1

Describe 'Set-SpecialChar' {
    It 'sets the given special chararacter' {
        Set-SpecialChar -Type BarJoiner -Char 'X'
        Get-SpecialChar -Type BarJoiner | Should -Be 'X'
    }

    It 'can set the special character to a string' {
        Set-SpecialChar -Type BarJoiner -Char 'Actually a string for complex shapes'
        Get-SpecialChar -Type BarJoiner | Should -Be 'Actually a string for complex shapes'
    }
}
