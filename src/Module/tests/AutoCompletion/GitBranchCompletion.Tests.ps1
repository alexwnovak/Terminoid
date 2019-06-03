. $PSScriptRoot\..\Shared.ps1

InModuleScope 'Terminoid' {
    Describe 'Git Branch completion' {
        Context 'Deleting a branch' {
            Mock GetGitBranches { 'branch1', 'branch2' }

            It 'resolves all branches' {
                $fileSuggestions = GitCommandCompleter -Command 'git branch -d '

                $fileSuggestions[0].CompletionText | Should -Be 'branch1'
                $fileSuggestions[1].CompletionText | Should -Be 'branch2'
            }
        }

        Context 'Deleting a branch with a partial search' {
            Mock GetGitBranches { 'first', 'second' }

            It 'resolves the branches that match' {
                $fileSuggestions = GitCommandCompleter -Command 'git branch -d sec'

                $fileSuggestions[0].CompletionText | Should -Be 'second'
            }
        }

        Context 'Deleting a branch with a wildcard search' {
            Mock GetGitBranches { 'first', 'second' }

            It 'resolves the branches that match' {
                $fileSuggestions = GitCommandCompleter -Command 'git branch -d *on*'

                $fileSuggestions[0].CompletionText | Should -Be 'second'
            }
        }
    }
}
