. $PSScriptRoot\Shared.ps1

InModuleScope 'Terminoid' {
    Describe 'Select-FromMany' {
        Mock Out-Host

        Context 'Selecting the default choice' {
            Mock Read-Key { 13 }

            It 'returns the first choice' {
                Select-FromMany -Choices First, Second, Third | Should -Be 'First'
            }
        }

        Context 'Selecting the second choice' {
            . $PSScriptRoot\Get-Many.ps1
            Mock Read-Key { Get-Many 40,13 }

            It 'returns the second choice' {
                Select-FromMany -Choices First, Second, Third | Should -Be 'Second'
            }
        }

        Context 'Cancelling' {
            Mock Read-Key { 27 }

            It 'returns null' {
                Select-FromMany -Choices First,Second,Third | Should -BeNullOrEmpty
            }
        }
    }
}
