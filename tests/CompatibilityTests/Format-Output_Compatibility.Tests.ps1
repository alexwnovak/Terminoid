﻿#==============================================================================
# Format-Output Compatibility Tests
#   These tests were automatically generated to ensure that this function's
#   public API is never accidentally changed (breaking backward compatibility).
#   When new functionality is added--or if breaking backward compatibility IS
#   intended, then this test should be generated to reflect the new public API.
#==============================================================================

Describe 'Format-Output compatibility' {
    BeforeEach {
        Get-Module -Name Terminoid -All | Remove-Module -Force -ErrorAction Ignore
        Import-Module $PSScriptRoot\..\..\src\Terminoid.psd1 -Force
    }
    It 'exposes a function named Format-Output' {
        Get-Command Format-Output -Module Terminoid | Should -Not -Be $null
    }
    It 'exposes exactly 16 parameters' {
        (Get-Command Format-Output).Parameters.Count | Should -Be 16
    }
}
