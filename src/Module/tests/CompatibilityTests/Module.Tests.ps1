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
        Import-Module $PSScriptRoot\..\..\Terminoid.psd1 -Force
    }
    It 'exposes exactly 30 functions' {
        (Get-Command -Module Terminoid).Count | Should -Be 30
    }
    It 'exposes exactly 0 variables' {
        (Get-Module Terminoid).ExportedVariables.Count | Should -Be 0
    }
    It 'exposes exactly 0 aliases' {
        (Get-Module Terminoid).ExportedAliases.Count | Should -Be 0
    }
    It 'registers a PSReadline key handler for Ctrl+o' {
        $keyHandler = Get-PSReadlineKeyHandler -Bound | Where-Object { $_.Key -ceq 'Ctrl+o' }
        $keyHandler.Function | Should -Be 'TerminoidInsertStartItem'
    }
    It 'registers a PSReadline key handler for Ctrl+n' {
        $keyHandler = Get-PSReadlineKeyHandler -Bound | Where-Object { $_.Key -ceq 'Ctrl+n' }
        $keyHandler.Function | Should -Be 'TerminoidInsertNewItem'
    }
    It 'registers a PSReadline key handler for Ctrl+N' {
        $keyHandler = Get-PSReadlineKeyHandler -Bound | Where-Object { $_.Key -ceq 'Ctrl+N' }
        $keyHandler.Function | Should -Be 'TerminoidInsertNewDirectory'
    }
}
