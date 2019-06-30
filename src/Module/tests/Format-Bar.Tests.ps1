. $PSScriptRoot\Shared.ps1

Describe 'Format-Bar' {
    $e = [char] 0x1B
    $joinerChar = Get-SpecialChar -Type BarJoiner

    It 'writes nothing if there are no bars' {
        Format-Bar -Parts @() | Should -Be $null
    }

    It 'writes a complete bar segment' {
        $bar = @{
            Foreground = 255, 255, 255
            Background = 0, 0, 0
            Text = 'segment-text'
        }

        Format-Bar -Parts $bar | Should -Be "$e[0;38;2;255;255;255;48;2;0;0;0m segment-text $e[0m$e[0;38;2;0;0;0m$joinerChar$e[0m "
    }

}