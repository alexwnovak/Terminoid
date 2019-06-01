. $PSScriptRoot\Shared.ps1

InModuleScope 'Terminoid' {
    Describe 'Git command completion' {
        Context 'No command is partially specified' {
            It 'resolves command suggestions' {
                $commandSuggestions = GitCommandCompleter -Command 'git '

                $commandSuggestions[0].CompletionText | Should -Be 'add'
                $commandSuggestions[1].CompletionText | Should -Be 'checkout'
            }
        }

        Context 'A command is partially specified' {
            It 'resolves partial matches' {
                $commandSuggestions = GitCommandCompleter -Command 'git ad'

                $commandSuggestions.CompletionText | Should -Be 'add'
            }
        }
    }

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
    }
}
