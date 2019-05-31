. $PSScriptRoot\Shared.ps1

InModuleScope 'Terminoid' {
    Describe 'Git Checkout completion' {
        Context 'One branch suggestion' {
            Mock GetGitBranches { 'branchName' }

            It 'resolves the only suggestion' {
                $branchSuggestions = GitCommandCompleter -Command 'git checkout '

                $branchSuggestions.CompletionText | Should -Be 'branchName'
            }
        }

        Context 'Two branch suggestions' {
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
