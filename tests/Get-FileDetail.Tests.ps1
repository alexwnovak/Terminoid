. $PSScriptRoot\Shared.ps1

Describe 'Get-FileDetail' {
    BeforeEach {
        Reset-DefaultFileDetailReader
        Reset-DetailReader
    }

    It 'gets default file details with no registered detail readers' {
        $testFile = Resolve-TestFile TextFile.txt
        $details = Get-FileDetail -Path $testFile

        $details.'Last Written' | Should -Be (Get-ChildItem $testFile).LastWriteTime
        $details.'File Size' | Should -Be '1,024 bytes'
    }

    It 'can configure a different default detail reader' {
        Set-DefaultFileDetailReader -Function {
            @{ DummyValue = 123 }
        }

        $testFile = Resolve-TestFile TextFile.txt
        $details = Get-FileDetail -Path $testFile

        $details.DummyValue | Should -Be 123
    }

    It 'can use the original default detail reader after being reset' {
        Set-DefaultFileDetailReader -Function { }
        Reset-DefaultFileDetailReader

        $testFile = Resolve-TestFile TextFile.txt
        $details = Get-FileDetail -Path $testFile

        $details.'Last Written' | Should -Be (Get-ChildItem $testFile).LastWriteTime
        $details.'File Size' | Should -Be '1,024 bytes'
    }

    It 'can use the original default detail reader when combined with another' {
        Register-FileDetailReader -Extension '.txt' -Function {
            @{ 'Extension' = '.txt' }
        }

        $testFile = Resolve-TestFile TextFile.txt
        $details = Get-FileDetail -Path $testFile

        $details.'Last Written' | Should -Be (Get-ChildItem $testFile).LastWriteTime
        $details.'File Size' | Should -Be '1,024 bytes'
        $details.'Extension' | Should -Be '.txt'
    }

    It 'can read the details from a BMP file' {
        $testFile = Resolve-TestFile BmpFile.bmp
        $details = Get-FileDetail -Path $testFile

        $details.Width | Should -Be 8
        $details.Height | Should -Be 4
    }
}
