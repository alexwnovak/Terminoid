. $PSScriptRoot\Shared.ps1

Describe 'Format-Color' {
    It 'writes unformatted text when omitting all color information' {
        Format-Color 'text' | Should -Be 'text'
    }

    It 'formats the input with a dark foreground console color of <Foreground>' -TestCases @(
        @{ Foreground = 'Black'; ExpectedForeground = 30 },
        @{ Foreground = 'DarkBlue'; ExpectedForeground = 34 },
        @{ Foreground = 'DarkGreen'; ExpectedForeground = 32 },
        @{ Foreground = 'DarkCyan'; ExpectedForeground = 36 },
        @{ Foreground = 'DarkRed'; ExpectedForeground = 31 },
        @{ Foreground = 'DarkMagenta'; ExpectedForeground = 35 },
        @{ Foreground = 'DarkYellow'; ExpectedForeground = 33 },
        @{ Foreground = 'Gray'; ExpectedForeground = 37 }
    ) {
        param ( $Foreground, $ExpectedForeground )

        Format-Color 'text' -Foreground $Foreground | Should -Be "$([char]0x1B)`[0;$($ExpectedForeground)mtext$([char]0x1B)`[0m"
    }
}
