. $PSScriptRoot\Shared.ps1

InModuleScope Terminoid {
    Describe 'Show-AutoCompletion' {
        BeforeEach {
            Reset-AutoCompletionHandler
        }

        Context 'There is space for all the items below the current line' {
            Mock GetCursorLocation { @{ Left = 1; Top = 1 } }
            Mock Get-ViewPort { @{ Width = 80; Height = 25 } }
            Mock ShowMenu { 0 }
            Register-AutoCompletionHandler -Predicate { $true } -Function { 'one', 'two', 'three' }

            Show-AutoCompletion

            It 'shows the box in below the current line' {
                Assert-MockCalled ShowMenu -ParameterFilter { $Y -eq 2 }
            }

            It "shows the box at the cursor's horizontal location" {
                Assert-MockCalled ShowMenu -ParameterFilter { $X -eq 1 }
            }
        }

        Context 'There is not enough space below the current line to show the items' {
            Mock GetCursorLocation { @{ Left = 1; Top = 13 } }
            Mock Get-ViewPort { @{ Width = 80; Height = 25 } }
            Mock ShowMenu { 0 }
            Register-AutoCompletionHandler -Predicate { $true } -Function { 'one', 'two', 'three' }

            Show-AutoCompletion

            It 'shows the box above the current line' {
                Assert-MockCalled ShowMenu -ParameterFilter { $Y -lt 13 }
            }

            It "shows the box at the cursor's horizontal location" {
                Assert-MockCalled ShowMenu -ParameterFilter { $X -eq 1 }
            }
        }

        Context 'There are no registered handlers that respond to the input' {
            Mock ShowMenu { -1 }
            Register-AutoCompletionHandler -Predicate { $true } -Function { 'one', 'two', 'three' }

            $selectedItem = Show-AutoCompletion

            It 'returns the selected item' {
                $selectedItem | Should -BeNullOrEmpty
            }
        }

        Context 'Selecting an item' {
            Mock ShowMenu { 1 }
            Register-AutoCompletionHandler -Predicate { $true } -Function { 'one', 'two', 'three' }

            $selectedItem = Show-AutoCompletion

            It 'returns the selected item' {
                $selectedItem | Should -Be 'two'
            }
        }
    }
}
