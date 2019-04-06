. $PSScriptRoot\Shared.ps1

Describe 'Get-FileStatistics' {
    It 'gets default file stats with no registered stat readers' {
       $testFile = Resolve-TestFile TextFile.txt
       $stats = Get-FileStatistics -Path $testFile

       $stats.'Last Written' | Should -Be (Get-ChildItem $testFile).LastWriteTime
       $stats.'File Size' | Should -Be '1,024 bytes'
    }
}
