. $PSScriptRoot\Shared.ps1

Describe "Push-BarSegment" {
    BeforeEach {
        Reset-GlobalState
    }

    Context 'Adding a new bar segment' {
        It 'recorded the background color' {
            Push-BarSegment -BackgroundColor Red -ForegroundColor White -Text 'not-used'
            $BarSegments[0].BackgroundColor | Should -Be Red
        }

        It 'recorded the foreground color' {
            Push-BarSegment -BackgroundColor Red -ForegroundColor White -Text 'not-used'
            $BarSegments[0].ForegroundColor | Should -Be White
        }

        It 'can provide the text from text' {
            Push-BarSegment -BackgroundColor Black -ForegroundColor Black -Text 'the-text'
            & $BarSegments[0].Function | Should -Be 'the-text'
        }

        It 'can provide the text from a function' {
            Push-BarSegment -BackgroundColor Black -ForegroundColor Black -Function { 'function-text' }
            & $BarSegments[0].Function | Should -Be 'function-text'
        }
    }
}
