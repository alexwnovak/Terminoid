. $PSScriptRoot\Shared.ps1

InModuleScope Terminoid {
    Describe 'Set-Location' {
        BeforeEach {
            Reset-GlobalState
        }

        Context 'records the new location after successfully navigating there' {
            Mock Set-LocationInternal { $LocationHistory.Count | Should -Be 0 }

            Set-Location -Path 'new-location'

            $LocationHistory | Should -Contain 'new-location'
        }
    }
}
