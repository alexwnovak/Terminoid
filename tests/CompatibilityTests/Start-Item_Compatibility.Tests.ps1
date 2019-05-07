#==============================================================================
# Start-Item Compatibility Tests
#   These tests were automatically generated to ensure that this function's
#   public API is never accidentally changed (breaking backward compatibility).
#   When new functionality is added--or if breaking backward compatibility IS
#   intended, then this test should be generated to reflect the new public API.
#==============================================================================

Describe 'Start-Item compatibility' {
    BeforeEach {
        Get-Module -Name Terminoid -All | Remove-Module -Force -ErrorAction Ignore
        Import-Module $PSScriptRoot\..\..\src\Terminoid.psd1 -Force
    }
    It 'exposes a function named Start-Item' {
        Get-Command Start-Item -Module Terminoid | Should -Not -Be $null
    }
    It 'exposes exactly 14 parameters' {
        (Get-Command Start-Item).Parameters.Count | Should -Be 14
    }
}
