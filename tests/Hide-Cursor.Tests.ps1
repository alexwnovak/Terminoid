. $PSScriptRoot\Shared.ps1

Describe 'Hide-Cursor' {
    It 'writes the terminal sequence to hide the cursor' {
        Hide-Cursor | Should -Be "$([char]0x1B)[?25l"
    }
}
