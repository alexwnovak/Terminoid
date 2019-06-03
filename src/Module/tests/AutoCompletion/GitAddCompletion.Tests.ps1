. $PSScriptRoot\..\Shared.ps1

InModuleScope 'Terminoid' {
    Describe 'Git Add completion' {
        Context 'Adding files with pending changes' {
            Mock GetModifiedFiles { 'one.txt', 'two.txt' }
            Mock GetUntrackedFiles { }

            It 'resolves the changed files' {
                $fileSuggestions = GitCommandCompleter -Command 'git add '

                $fileSuggestions[0].CompletionText | Should -Be 'one.txt'
                $fileSuggestions[1].CompletionText | Should -Be 'two.txt'
            }
        }

        Context 'Adding untracked files' {
            Mock GetModifiedFiles { }
            Mock GetUntrackedFiles { 'untracked1.txt', 'untracked2.txt' }

            It 'resolves the untracked files' {
                $fileSuggestions = GitCommandCompleter -Command 'git add '

                $fileSuggestions[0].CompletionText | Should -Be 'untracked1.txt'
                $fileSuggestions[1].CompletionText | Should -Be 'untracked2.txt'
            }
        }

        Context 'Adding modified and untracked files' {
            Mock GetModifiedFiles { 'modified.txt' }
            Mock GetUntrackedFiles { 'untracked.txt' }

            It 'groups results by modified, then untracked' {
                $fileSuggestions = GitCommandCompleter -Command 'git add '

                $fileSuggestions[0].CompletionText | Should -Be 'modified.txt'
                $fileSuggestions[1].CompletionText | Should -Be 'untracked.txt'
            }
        }

        Context 'Adding with a partial completion' {
            Mock GetModifiedFiles { 'other.txt', 'file.bmp' }
            Mock GetUntrackedFiles { 'file.txt' }

            It 'resolves the matches' {
                $fileSuggestions = GitCommandCompleter -Command 'git add f'

                $fileSuggestions[0].CompletionText | Should -Be 'file.bmp'
                $fileSuggestions[1].CompletionText | Should -Be 'file.txt'
            }
        }
    }
}
