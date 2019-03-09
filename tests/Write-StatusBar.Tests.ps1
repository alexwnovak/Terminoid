. $PSScriptRoot\Shared.ps1

Describe 'Write-StatusBar' {
    BeforeEach {
        Reset-GlobalState
    }

    Mock -ModuleName Terminoid Write-Color { }

    It 'writes nothing if there are no bars' {
        Write-StatusBar

        Assert-MockCalled -ModuleName Terminoid Write-Color -Times 0
    }

    It 'has one bar and writes the value with the joiner character' {
        Push-BarSegment -ForegroundColor 255,255,255 -BackgroundColor 0,0,0 -Text 'segment-text'
        Write-StatusBar

        Assert-MockCalled -ModuleName Terminoid Write-Color -ParameterFilter {
            $Object -eq ' segment-text ' -and `
            $null -eq ($Foreground | Compare-Object @(255,255,255)) -and `
            $null -eq ($Background | Compare-Object @(0,0,0)) -and `
            $NoNewline -eq $true
        }

        Assert-MockCalled -ModuleName Terminoid Write-Color -ParameterFilter {
            $Object -eq "$([char]0xE0B0)" -and `
            $null -eq ($Foreground | Compare-Object @(0,0,0))
        }
    }
}
