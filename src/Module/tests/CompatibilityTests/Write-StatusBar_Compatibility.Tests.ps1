﻿#==============================================================================
# Write-StatusBar Compatibility Tests
#   These tests were automatically generated to ensure that this function's
#   public API is never accidentally changed (breaking backward compatibility).
#   When new functionality is added--or if breaking backward compatibility IS
#   intended, then this test should be generated to reflect the new public API.
#==============================================================================

Describe 'Write-StatusBar compatibility' {
    BeforeEach {
        Get-Module -Name Terminoid -All | Remove-Module -Force -ErrorAction Ignore
        Import-Module $PSScriptRoot\..\..\Terminoid.psd1 -Force
    }
    It 'exposes a function named Write-StatusBar' {
        Get-Command Write-StatusBar -Module Terminoid | Should -Not -Be $null
    }
    It 'exposes exactly 0 parameters' {
        (Get-Command Write-StatusBar).Parameters.Count | Should -Be 0
    }
}
