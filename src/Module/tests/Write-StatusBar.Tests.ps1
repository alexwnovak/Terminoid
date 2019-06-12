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
        Push-BarSegment -Foreground 255,255,255 -Background 0,0,0 -Text 'segment-text'

        Write-StatusBar | Should -Be "$e[0;38;2;255;255;255;48;2;0;0;0m segment-text $e[0m$e[0;38;2;0;0;0m$joinerChar$e[0m "
    }

    It 'writes two bars joined together' {
        Push-BarSegment -Foreground 255,255,255 -Background 64,64,64 -Text 'first-segment'
        Push-BarSegment -Foreground 0,0,0 -Background 255,0,0 -Text 'second-segment'
        Write-StatusBar | Should -Be "$e[0;38;2;255;255;255;48;2;64;64;64m first-segment $e[0m$e[0;38;2;64;64;64;48;2;255;0;0m$joinerChar$e[0m$e[0;38;2;0;0;0;48;2;255;0;0m second-segment $e[0m$e[0;38;2;255;0;0m$joinerChar$e[0m "
    }
}
