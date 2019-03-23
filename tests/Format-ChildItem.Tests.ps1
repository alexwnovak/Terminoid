. $PSScriptRoot\Shared.ps1

Describe 'Format-ChildItem' {
    It 'passes the object through the pipeline by default' {
        $filteredOutput = @(1,2,3) | Format-ChildItem

        $filteredOutput[0] | Should -Be 1
        $filteredOutput[1] | Should -Be 2
        $filteredOutput[2] | Should -Be 3
    }
}
