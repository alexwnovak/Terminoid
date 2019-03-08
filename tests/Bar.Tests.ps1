. $PSScriptRoot\Shared.ps1

Describe "Push-BarSegment" {
    Context "Adding a new bar segment with colors and text" {
        Push-BarSegment -BackgroundColor Red -ForegroundColor White -Text TheText

        It 'recorded the background color' {
            $BarSegments[0].BackgroundColor | Should -Be Red
        }

        It 'recorded the foreground color' {
            $BarSegments[0].ForegroundColor | Should -Be White
        }

        It 'can provide the text' {
            & $BarSegments[0].Function | Should -Be TheText
        }
    }
}
