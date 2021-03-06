. $PSScriptRoot\Shared.ps1

Describe 'Format-Bar' {
    $e = [char] 0x1B
    $joinerChar = Get-SpecialChar -Type BarJoiner

    It 'writes nothing if there are no bars' {
        Format-Bar -Parts @() | Should -Be $null
        Format-Bar -Parts $null | Should -Be $null
    }

    It 'writes a single bar segment' {
        $bar = @{
            Foreground = 255, 255, 255
            Background = 0, 0, 0
            Text = 'segment-text'
        }

        Format-Bar -Parts $bar | Should -Be "$e[0;38;2;255;255;255;48;2;0;0;0m segment-text $e[0m$e[0;38;2;0;0;0m$joinerChar$e[0m "
    }

    It 'writes a single-item array of one segment' {
        $bar = @{
            Foreground = 255, 255, 255
            Background = 0, 0, 0
            Text = 'segment-text'
        }

        Format-Bar -Parts @($bar) | Should -Be "$e[0;38;2;255;255;255;48;2;0;0;0m segment-text $e[0m$e[0;38;2;0;0;0m$joinerChar$e[0m "
    }

    It 'writes two bars joined together' {
        $bar1 = @{
            Foreground = 255, 255, 255
            Background = 64, 64, 64
            Text = 'first-segment'
        }

        $bar2 = @{
            Foreground = 0, 0, 0
            Background = 255, 0, 0
            Text = 'second-segment'
        }

        Format-Bar -Parts $bar1, $bar2 | Should -Be "$e[0;38;2;255;255;255;48;2;64;64;64m first-segment $e[0m$e[0;38;2;64;64;64;48;2;255;0;0m$joinerChar$e[0m$e[0;38;2;0;0;0;48;2;255;0;0m second-segment $e[0m$e[0;38;2;255;0;0m$joinerChar$e[0m "
    }
}
