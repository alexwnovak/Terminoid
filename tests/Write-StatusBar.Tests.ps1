. $PSScriptRoot\Shared.ps1

Describe 'Write-StatusBar' {
    BeforeEach {
        Reset-GlobalState
    }

    $e = [char] 0x1B

    It 'writes nothing if there are no bars' {
        Write-StatusBar | Should -Be $null
    }

    It 'writes a complete bar segment' {
        Push-BarSegment -ForegroundColor 255,255,255 -BackgroundColor 0,0,0 -Text 'segment-text'

        Write-StatusBar | Should -Be "$e[0;38;2;255;255;255;48;2;0;0;0m segment-text $e[0m$e[0;38;2;0;0;0m$JoinerChar$e[0m"
    }
}
