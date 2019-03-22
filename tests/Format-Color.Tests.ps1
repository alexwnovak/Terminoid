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

    It 'formats the input with a bright foreground console color of <Foreground>' -TestCases @(
        @{ Foreground = 'DarkGray'; ExpectedForeground = 30 },
        @{ Foreground = 'Blue'; ExpectedForeground = 34 },
        @{ Foreground = 'Green'; ExpectedForeground = 32 },
        @{ Foreground = 'Cyan'; ExpectedForeground = 36 },
        @{ Foreground = 'Red'; ExpectedForeground = 31 },
        @{ Foreground = 'Magenta'; ExpectedForeground = 35 },
        @{ Foreground = 'Yellow'; ExpectedForeground = 33 },
        @{ Foreground = 'White'; ExpectedForeground = 37 }
    ) {
        param ( $Foreground, $ExpectedForeground )

        Format-Color 'text' -Foreground $Foreground | Should -Be "$([char]0x1B)`[1;$($ExpectedForeground)mtext$([char]0x1B)`[0m"
    }

    It 'formats the input with a dark background console color of <Background>' -Testcases @(
        @{ Background = 'Black'; ExpectedBackground = 40 },
        @{ Background = 'DarkBlue'; ExpectedBackground = 44 },
        @{ Background = 'DarkGreen'; ExpectedBackground = 42 }
        @{ Background = 'DarkCyan'; ExpectedBackground = 46 },
        @{ Background = 'DarkRed'; ExpectedBackground = 41 },
        @{ Background = 'DarkMagenta'; ExpectedBackground = 45 },
        @{ Background = 'DarkYellow'; ExpectedBackground = 43 },
        @{ Background = 'Gray'; ExpectedBackground = 47 }
    ) {
        param ( $Background, $ExpectedBackground )

        Format-Color 'text' -Background $Background | Should -Be "$([char]0x1B)`[0;$($ExpectedBackground)mtext$([char]0x1B)`[0m"
    }

    It 'formats the input with a bright background console color of <Background>' -Testcases @(
        @{ Background = 'DarkGray'; ExpectedBackground = 100 },
        @{ Background = 'Blue'; ExpectedBackground = 104 },
        @{ Background = 'Green'; ExpectedBackground = 102 }
        @{ Background = 'Cyan'; ExpectedBackground = 106 },
        @{ Background = 'Red'; ExpectedBackground = 101 },
        @{ Background = 'Magenta'; ExpectedBackground = 105 },
        @{ Background = 'Yellow'; ExpectedBackground = 103 },
        @{ Background = 'White'; ExpectedBackground = 107 }
    ) {
        param ( $Background, $ExpectedBackground )

        Format-Color 'text' -Background $Background | Should -Be "$([char]0x1B)`[0;$($ExpectedBackground)mtext$([char]0x1B)`[0m"
    }

}
