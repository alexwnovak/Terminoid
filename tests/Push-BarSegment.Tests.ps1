. $PSScriptRoot\Shared.ps1

Describe "Push-BarSegment" {
    BeforeEach {
        Reset-GlobalState
    }

    Context 'Adding a new bar segment' {
        It 'records the background color' {
            Push-BarSegment -BackgroundColor 255,0,0 -ForegroundColor 0,0,0 -Text 'not-used'

            $BarSegments[0].BackgroundColor | Should -Be 255,0,0
        }

        It 'records the foreground color' {
            Push-BarSegment -BackgroundColor 0,0,0 -ForegroundColor 255,255,255 -Text 'not-used'

            $BarSegments[0].ForegroundColor | Should -Be 255,255,255
        }

        It 'records both foreground and background color' {
            Push-BarSegment -BackgroundColor 64,64,64 -ForegroundColor 255,255,255 -Text 'not-used'

            $BarSegments[0].BackgroundColor | Should -Be 64,64,64
            $BarSegments[0].ForegroundColor | Should -Be 255,255,255
        }

        It 'can provide the text from text' {
            Push-BarSegment -ForegroundColor 0,0,0 -BackgroundColor 0,0,0 -Text 'the-text'

            & $BarSegments[0].Function | Should -Be 'the-text'
        }

        It 'can provide the text from a function' {
            Push-BarSegment -ForegroundColor 0,0,0 -BackgroundColor 0,0,0 -Function { 'function-text' }

            & $BarSegments[0].Function | Should -Be 'function-text'
        }

        It 'can record an extra piece of data' {
            $complexObject = @{
                'KeyOne' = 'ValueOne';
                'KeyTwo' = 'ValueTwo';
            }

            Push-BarSegment -BackgroundColor 0,0,0 -ForegroundColor 0,0,0 -Text { 'not-used' } -Tag $complexObject
            $BarSegments[0].Tag | Should -Be $complexObject
        }

        It 'has no extra data by default' {
            Push-BarSegment -BackgroundColor 0,0,0 -ForegroundColor 0,0,0 -Text { 'not-used' }
            $BarSegments[0].Tag | Should -Be $null
        }

        It 'can remove the bar segment' {
            Push-BarSegment -BackgroundColor 0,0,0 -ForegroundColor 0,0,0 -Text { 'not-used' }
            Pop-BarSegment

            $BarSegments.Count | Should -Be 0
        }
    }
}
