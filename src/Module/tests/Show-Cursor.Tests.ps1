. $PSScriptRoot\Shared.ps1

Describe 'Show-Cursor' {
    It 'writes the terminal sequence to show the cursor ' {
        Show-Cursor | Should -Be "$([char]0x1B)[?25h"
    }
}
