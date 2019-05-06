#==============================================================================
# Module Tests
#   These tests were automatically generated to ensure only the expected
#   behavior is exposed from the module. This protects against accidentally
#   removing something and breaking backward compatibility. When new functions
#   are added, this test should be regenerated to reflect the new public API.
#==============================================================================

Describe 'Module behavior' {
    BeforeEach {
        Get-Module -Name Terminoid -All | Remove-Module -Force -ErrorAction Ignore
        Import-Module $PSScriptRoot\..\..\src\Terminoid.psd1 -Force
    }
    It 'exposes exactly 25 functions' {
        (Get-Command -Module Terminoid).Count | Should -Be 25
    }
    It 'exposes exactly 0 variables' {
        (Get-Module Terminoid).ExportedVariables.Count | Should -Be 0
    }
    It 'exposes exactly 0 aliases' {
        (Get-Module Terminoid).ExportedAliases.Count | Should -Be 0
    }
}
