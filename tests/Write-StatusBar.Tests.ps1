. $PSScriptRoot\Shared.ps1

Describe 'Write-StatusBar' {
    BeforeEach {
        Reset-GlobalState
    }

    $e = [char] 0x1B
    $joinerChar = Get-SpecialChar -Type BarJoiner

    It 'writes nothing if there are no bars' {
        Write-StatusBar | Should -Be $null
    }

    It 'writes a complete bar segment' {
        Push-BarSegment -ForegroundColor 255,255,255 -BackgroundColor 0,0,0 -Text 'segment-text'

        Write-StatusBar | Should -Be "$e[0;38;2;255;255;255;48;2;0;0;0m segment-text $e[0m$e[0;38;2;0;0;0m$joinerChar$e[0m "
    }

    It 'writes two bars joined together' {
        Push-BarSegment -ForegroundColor 255,255,255 -BackgroundColor 64,64,64 -Text 'first-segment'
        Push-BarSegment -ForegroundColor 0,0,0 -BackgroundColor 255,0,0 -Text 'second-segment'
        Write-StatusBar | Should -Be "$e[0;38;2;255;255;255;48;2;64;64;64m first-segment $e[0m$e[0;38;2;64;64;64;48;2;255;0;0m$joinerChar$e[0m$e[0;38;2;0;0;0;48;2;255;0;0m second-segment $e[0m$e[0;38;2;255;0;0m$joinerChar$e[0m "
    }
}
