. $PSScriptRoot\Shared.ps1

Describe 'Format-Output' {
    It 'writes unformatted text when omitting all color information' {
        Format-Output 'text' | Should -Be 'text'
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

        Format-Output 'text' -Foreground $Foreground | Should -Be "$([char]0x1B)`[0;$($ExpectedForeground)mtext$([char]0x1B)`[0m"
    }

    It 'formats the input with a bright foreground console color of <Foreground>' -TestCases @(
        @{ Foreground = 'DarkGray'; ExpectedForeground = 90 },
        @{ Foreground = 'Blue'; ExpectedForeground = 94 },
        @{ Foreground = 'Green'; ExpectedForeground = 92 },
        @{ Foreground = 'Cyan'; ExpectedForeground = 96 },
        @{ Foreground = 'Red'; ExpectedForeground = 91 },
        @{ Foreground = 'Magenta'; ExpectedForeground = 95 },
        @{ Foreground = 'Yellow'; ExpectedForeground = 93 },
        @{ Foreground = 'White'; ExpectedForeground = 97 }
    ) {
        param ( $Foreground, $ExpectedForeground )

        Format-Output 'text' -Foreground $Foreground | Should -Be "$([char]0x1B)`[0;$($ExpectedForeground)mtext$([char]0x1B)`[0m"
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

        Format-Output 'text' -Background $Background | Should -Be "$([char]0x1B)`[0;$($ExpectedBackground)mtext$([char]0x1B)`[0m"
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

        Format-Output 'text' -Background $Background | Should -Be "$([char]0x1B)`[0;$($ExpectedBackground)mtext$([char]0x1B)`[0m"
    }

    It 'formats the input with a background and foreground console color' {
        $formattedOutput = Format-Output text -Foreground White -Background DarkBlue

        $formattedOutput | Should -Be "$([char]0x1B)`[0;97;44mtext$([char]0x1B)`[0m"
    }

    It 'throws when passing less than 3 values for an RGB foreground' {
        $formatOutput = { Format-Output text -Foreground 100,150 }

        $formatOutput | Should -Throw
    }

    It 'throws when passing more than 3 values for an RGB foreground' {
        $formatOutput = { Format-Output text -Foreground 1,2,3,4 }

        $formatOutput | Should -Throw
    }

    It 'formats the input with an RGB foreground color' {
       $formattedOutput = Format-Output text -Foreground 100,150,200

       $formattedOutput | Should -Be "$([char]0x1B)`[0;38;2;100;150;200mtext$([char]0x1B)`[0m"
    }

    It 'formats the input with an RGB background color' {
        $formattedOutput = Format-Output text -Background 100, 150, 200

        $formattedOutput | Should -Be "$([char]0x1B)`[0;48;2;100;150;200mtext$([char]0x1B)`[0m"
    }

    It 'formats a list of piped inputs' {
        $formattedOutput = @('text') | Format-Output -Foreground White -Background DarkGray

        $formattedOutput | Should -Be "$([char]0x1B)`[0;97;100mtext$([char]0x1B)`[0m"
    }

    It 'can italicize the input' {
        Format-Output text -Italic | Should -Be "$([char]0x1B)`[0;3mtext$([char]0x1B)`[0m"
    }

    It 'can underline the input' {
        Format-Output text -Underline | Should -Be "$([char]0x1B)`[0;4mtext$([char]0x1B)`[0m"
    }
}
