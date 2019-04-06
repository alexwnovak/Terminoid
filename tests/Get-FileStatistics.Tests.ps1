. $PSScriptRoot\Shared.ps1

Describe 'Get-FileStatistics' {
    BeforeEach {
        Reset-StatReader
    }

    It 'gets default file stats with no registered stat readers' {
       $testFile = Resolve-TestFile TextFile.txt
       $stats = Get-FileStatistics -Path $testFile

       $stats.'Last Written' | Should -Be (Get-ChildItem $testFile).LastWriteTime
       $stats.'File Size' | Should -Be '1,024 bytes'
    }

    It 'can configure a different default stat reader' {
        Set-DefaultFileStatReader -Function {
            @{ DummyValue = 123 }
        }

        $testFile = Resolve-TestFile TextFile.txt
        $stats = Get-FileStatistics -Path $testFile

        $stats.DummyValue | Should -Be 123
    }

    It 'can use the original default stat reader after being reset' {
        Set-DefaultFileStatReader -Function { }
        Reset-DefaultFileStatReader

        $testFile = Resolve-TestFile TextFile.txt
        $stats = Get-FileStatistics -Path $testFile

        $stats.'Last Written' | Should -Be (Get-ChildItem $testFile).LastWriteTime
        $stats.'File Size' | Should -Be '1,024 bytes'
    }

    It 'can use the original default stat reader when combined with another' {
        Register-FileStatReader -Extension '.txt' -Function {
            @{ 'Extension' = '.txt' }
        }

        $testFile = Resolve-TestFile TextFile.txt
        $stats = Get-FileStatistics -Path $testFile

        $stats.'Last Written' | Should -Be (Get-ChildItem $testFile).LastWriteTime
        $stats.'File Size' | Should -Be '1,024 bytes'
        $stats.'Extension' | Should -Be '.txt'
    }

    It 'can read the details from a BMP file' {
        $testFile = Resolve-TestFile BmpFile.bmp
        $stats = Get-FileStatistics -Path $testFile

        $stats.Width | Should -Be 8
        $stats.Height | Should -Be 4
    }
}
