. $PSScriptRoot\..\Shared.ps1

InModuleScope 'Terminoid' {
    Describe 'Git command completion' {
        Context 'No command is partially specified' {
            It 'resolves command suggestions' {
                $commandSuggestions = GitCommandCompleter -Command 'git '

                $commandSuggestions[0].CompletionText | Should -Be 'add'
                $commandSuggestions[1].CompletionText | Should -Be 'branch'
                $commandSuggestions[2].CompletionText | Should -Be 'checkout'
            }
        }

        Context 'A command is partially specified' {
            It 'resolves partial matches' {
                $commandSuggestions = GitCommandCompleter -Command 'git ad'

                $commandSuggestions.CompletionText | Should -Be 'add'
            }
        }
    }
}
