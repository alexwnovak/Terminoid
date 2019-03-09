. $PSScriptRoot\Shared.ps1

Describe 'Write-StatusBar' {
    BeforeEach {
        Reset-GlobalState
    }

    Mock -ModuleName Terminoid Write-Host { }

    Context 'There are no bars' {
        It 'writes an empty string' {
            Write-StatusBar

            Assert-MockCalled -ModuleName Terminoid Write-Host -Times 0
        }
    }
}
