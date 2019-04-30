﻿#==============================================================================
# Set-DefaultFileDetailReader Compatibility Tests
#   These tests were automatically generated to ensure that this function's
#   public API is never accidentally changed (breaking backward compatibility).
#   When new functionality is added--or if breaking backward compatibility IS
#   intended, then this test should be generated to reflect the new public API.
#==============================================================================

Describe 'Set-DefaultFileDetailReader compatibility' {
    BeforeEach {
        Get-Module -Name Terminoid -All | Remove-Module -Force -ErrorAction Ignore
        Import-Module $PSScriptRoot\..\..\src\Terminoid.psd1 -Force
    }
    It 'exposes a function named Set-DefaultFileDetailReader' {
        Get-Command Set-DefaultFileDetailReader -Module Terminoid | Should -Not -Be $null
    }
    It 'exposes exactly 1 parameter' {
        (Get-Command Set-DefaultFileDetailReader).Parameters.Count | Should -Be 1
    }
}
