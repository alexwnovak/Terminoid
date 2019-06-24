. $PSScriptRoot\Shared.ps1

InModuleScope 'Terminoid' {
    Describe 'Test-GitRepoPath' {
        Context 'At the root of a repository' {
            Mock Test-Path { $true }

            It 'finds the repository' {
                Test-GitRepoPath | Should -Be $true
            }
        }

        Context 'In a repository sub-directory' {
            . $PSScriptRoot\Get-Many.ps1
            Mock Test-Path { Get-Many $false, $true }

            It 'finds the repository' {
                Test-GitRepoPath | Should -Be $true
            }
        }

        Context 'Not in a repository' {
            Mock Test-Path { $false }

            It 'does not find the repository' {
                Test-GitRepoPath | Should -Be $false
            }
        }
    }
}
