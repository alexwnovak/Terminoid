. $PSScriptRoot\..\Shared.ps1

InModuleScope 'Terminoid' {
    Describe 'Git Checkout completion' {
        Context 'Changing to another branch when there is only one available' {
            Mock GetGitBranches { 'branchName' }

            It 'resolves the only suggestion' {
                $branchSuggestions = GitCommandCompleter -Command 'git checkout '

                $branchSuggestions.CompletionText | Should -Be 'branchName'
            }
        }

        Context 'Changing to another branch when there are two available' {
            Mock GetGitBranches { 'first','second' }

            It 'resolves both suggestions' {
                $branchSuggestions = GitCommandCompleter -Command 'git checkout '

                $branchSuggestions[0].CompletionText | Should -Be 'first'
                $branchSuggestions[1].CompletionText | Should -Be 'second'
            }
        }

        Context 'Completing a partial search' {
            Mock GetGitBranches { 'one','two','three' }

            It 'resolves the branches who match the partial search' {
                $branchSuggestions = GitCommandCompleter -Command 'git checkout t'

                $branchSuggestions[0].CompletionText | Should -Be 'two'
                $branchSuggestions[1].CompletionText | Should -Be 'three'
            }
        }

        Context 'Completing a wildcard search' {
            Mock GetGitBranches { 'one', 'two', 'three' }

            It 'resolves the branches who match the partial search' {
                $branchSuggestions = GitCommandCompleter -Command 'git checkout *hre*'

                $branchSuggestions[0].CompletionText | Should -Be 'three'
            }
        }

        Context 'Creating a new branch' {
            Mock GetGitBranches { 'one', 'two', 'three' }

            It 'resolves no suggestions' {
                GitCommandCompleter -Command 'git checkout -b ' | Should -BeNullOrEmpty
            }
        }
    }
}
