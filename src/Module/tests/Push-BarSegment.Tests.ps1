. $PSScriptRoot\Shared.ps1

Describe "Push-BarSegment" {
    BeforeEach {
        Reset-GlobalState
    }

    Context 'Adding a new bar segment' {
        It 'records the background color' {
            Push-BarSegment -Background 255,0,0 -Foreground 0,0,0 -Text 'not-used'

            (Get-BarSegment).BackgroundColor | Should -Be 255,0,0
        }

        It 'records the foreground color' {
            Push-BarSegment -Background 0,0,0 -Foreground 255,255,255 -Text 'not-used'

            (Get-BarSegment).ForegroundColor | Should -Be 255,255,255
        }

        It 'records both foreground and background color' {
            Push-BarSegment -Background 64,64,64 -Foreground 255,255,255 -Text 'not-used'

            $barSegments = Get-BarSegment
            $barSegments.BackgroundColor | Should -Be 64,64,64
            $barSegments.ForegroundColor | Should -Be 255,255,255
        }

        It 'can provide the text from text' {
            Push-BarSegment -Foreground 0,0,0 -Background 0,0,0 -Text 'the-text'

            & (Get-BarSegment).Function | Should -Be 'the-text'
        }

        It 'can provide the text from a function' {
            Push-BarSegment -Foreground 0,0,0 -Background 0,0,0 -Function { 'function-text' }

            & (Get-BarSegment).Function | Should -Be 'function-text'
        }

        It 'can record an extra piece of data' {
            $complexObject = @{
                'KeyOne' = 'ValueOne';
                'KeyTwo' = 'ValueTwo';
            }

            Push-BarSegment -Background 0,0,0 -Foreground 0,0,0 -Text { 'not-used' } -Tag $complexObject
            (Get-BarSegment).Tag | Should -Be $complexObject
        }

        It 'has no extra data by default' {
            Push-BarSegment -Background 0,0,0 -Foreground 0,0,0 -Text { 'not-used' }
            (Get-BarSegment).Tag | Should -Be $null
        }

        It 'can remove the bar segment' {
            Push-BarSegment -Background 0,0,0 -Foreground 0,0,0 -Text { 'not-used' }
            Pop-BarSegment

            @(Get-BarSegment).Count | Should -Be 0
        }
    }
}
