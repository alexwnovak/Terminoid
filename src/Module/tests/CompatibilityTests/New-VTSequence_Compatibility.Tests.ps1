#==============================================================================
# New-VTSequence Compatibility Tests
#   These tests were automatically generated to ensure that this function's
#   public API is never accidentally changed (breaking backward compatibility).
#   When new functionality is added--or if breaking backward compatibility IS
#   intended, then this test should be generated to reflect the new public API.
#==============================================================================

Describe 'New-VTSequence compatibility' {
    BeforeEach {
        Get-Module -Name Terminoid -All | Remove-Module -Force -ErrorAction Ignore
        Import-Module $PSScriptRoot\..\..\Terminoid.psd1 -Force
    }
    It 'exposes a function named New-VTSequence' {
        Get-Command New-VTSequence -Module Terminoid | Should -Not -Be $null
    }
    It 'exposes exactly 17 parameters' {
        (Get-Command New-VTSequence).Parameters.Count | Should -Be 17
    }
}
