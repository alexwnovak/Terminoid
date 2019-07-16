. $PSScriptRoot\Shared.ps1

Describe 'Show-AutoCompletion' {
    Context 'There is space for all the items below the current line' {
        It 'shows the box in below the current line' {
        }
    }

    Context 'There is not enough space below the current line to show the items' {
        It 'shows the box above the current line' {
        }
    }
}
