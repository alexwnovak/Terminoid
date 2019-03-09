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

    It 'writes text with a foreground color' {
        Write-Color 'text' -Foreground 255,0,0

        Assert-MockCalled -ModuleName Terminoid Write-Host -Times 1 -ParameterFilter {
            $Object -eq "$([char]0x1B)`[0m38;2;255;0;0mtext$([char]0x1B)`[0m"
        }
    }

    It 'writes text with a background color' {
        Write-Color 'text' -Background 255, 0, 0

        $Object -eq "$([char]0x1B)`[0m48;2;255;0;0mtext$([char]0x1B)`[0m"
    }
}
