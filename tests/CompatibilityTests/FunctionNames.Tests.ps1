#==============================================================================
# Function Name Tests
#   These tests were automatically generated to ensure only the expected
#   functions are exposed from the module. This protects against accidentally
#   removing something and breaking backward compatibility. When new functions
#   are added, this test should be regenerated to reflect the new public API.
#==============================================================================

Describe 'Function names' {
    BeforeEach {
        Get-Module -Name Terminoid -All | Remove-Module -Force -ErrorAction Ignore
        Import-Module $PSScriptRoot\..\..\src\Terminoid.psd1 -Force
    }
    Context 'The module exposes only the expected functions' {
        It 'exposes exactly 23 commands' {
            (Get-Command -Module Terminoid).Count | Should -Be 23
        }
        It 'exposes a function named Clear-BarSegment' {
            Get-Command Clear-BarSegment -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Clear-FormatterTable' {
            Get-Command Clear-FormatterTable -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Clear-LocationHistory' {
            Get-Command Clear-LocationHistory -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Format-ChildItem' {
            Get-Command Format-ChildItem -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Format-Date' {
            Get-Command Format-Date -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Format-Output' {
            Get-Command Format-Output -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Format-Size' {
            Get-Command Format-Size -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Get-BarSegment' {
            Get-Command Get-BarSegment -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Get-FileDetail' {
            Get-Command Get-FileDetail -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Get-LocationHistory' {
            Get-Command Get-LocationHistory -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Get-SpecialChar' {
            Get-Command Get-SpecialChar -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Hide-Cursor' {
            Get-Command Hide-Cursor -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Pop-BarSegment' {
            Get-Command Pop-BarSegment -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Push-BarSegment' {
            Get-Command Push-BarSegment -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Push-Location' {
            Get-Command Push-Location -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Register-ChildItemFormatter' {
            Get-Command Register-ChildItemFormatter -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Register-FileDetailReader' {
            Get-Command Register-FileDetailReader -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Reset-DefaultFileDetailReader' {
            Get-Command Reset-DefaultFileDetailReader -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Reset-DetailReader' {
            Get-Command Reset-DetailReader -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Set-DefaultFileDetailReader' {
            Get-Command Set-DefaultFileDetailReader -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Set-Location' {
            Get-Command Set-Location -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Show-Cursor' {
            Get-Command Show-Cursor -Module Terminoid | Should -Not -Be $null
        }
        It 'exposes a function named Write-StatusBar' {
            Get-Command Write-StatusBar -Module Terminoid | Should -Not -Be $null
        }
    }
}
