. $PSScriptRoot\Shared.ps1

Describe 'Write-Color' {
    Mock -ModuleName Terminoid Write-Host { }

    It 'writes plain text with no formatting' {
        Write-Color 'Some text'

        Assert-MockCalled -ModuleName Terminoid Write-Host -ParameterFilter { $Object -eq 'Some text' } -Times 1
    }

    It 'writes a newline by default' {
        Write-Color 'doesnt-matter'

        Assert-MockCalled -ModuleName Terminoid Write-Host -ParameterFilter { $NoNewline -eq $false } -Times 1
    }

    It 'writes text with no newline' {
        Write-Color 'doesnt-matter' -NoNewline

        Assert-MockCalled -ModuleName Terminoid Write-Host -ParameterFilter { $NoNewline -eq $true } -Times 1
    }
}
