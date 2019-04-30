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
    It 'exposes exactly 23 functions' {
        (Get-Command -Module Terminoid).Count | Should -Be 23
    }
}
