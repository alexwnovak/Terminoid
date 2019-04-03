. $PSScriptRoot\Shared.ps1

Describe 'Enable-Cursor' {
    It 'writes the terminal sequence to show the cursor ' {
        Enable-Cursor | Should -Be "$([char]0x1B)[?25h"
    }
}
