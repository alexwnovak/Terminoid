#==============================================================================
# Push-BarSegment Compatibility Tests
#   These tests were automatically generated to ensure that this function's
#   public API is never accidentally changed (breaking backward compatibility).
#   When new functionality is added--or if breaking backward compatibility IS
#   intended, then this test should be generated to reflect the new public API.
#==============================================================================

Describe 'Push-BarSegment compatibility' {
    BeforeEach {
        Get-Module -Name Terminoid -All | Remove-Module -Force -ErrorAction Ignore
        Import-Module $PSScriptRoot\..\..\Terminoid.psd1 -Force
    }
    It 'exposes a function named Push-BarSegment' {
        Get-Command Push-BarSegment -Module Terminoid | Should -Not -Be $null
    }
    It 'exposes exactly 19 parameters' {
        (Get-Command Push-BarSegment).Parameters.Count | Should -Be 19
    }
}
