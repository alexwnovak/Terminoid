. $PSScriptRoot\Shared.ps1

Describe 'Disable-Cursor' {
    It 'writes the terminal sequence to hide the cursor' {
        Disable-Cursor | Should -Be "$([char]0x1B)[?25l"
    }
}
