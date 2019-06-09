. $PSScriptRoot\Shared.ps1

Describe 'New-VTSequence' {
    Context 'Uses no formatting' {
        It 'applies no formatting' {
            New-VTSequence 'text' | Should -Be 'text'
        }
    }

    Context 'Using a foreground' {
        It 'formats the input with a foreground console color of <Foreground>' -TestCases @(
            @{ Foreground = [ConsoleColor]::Black; ExpectedForeground = 30 },
            @{ Foreground = [ConsoleColor]::DarkBlue; ExpectedForeground = 34 },
            @{ Foreground = [ConsoleColor]::DarkGreen; ExpectedForeground = 32 },
            @{ Foreground = [ConsoleColor]::DarkCyan; ExpectedForeground = 36 },
            @{ Foreground = [ConsoleColor]::DarkRed; ExpectedForeground = 31 },
            @{ Foreground = [ConsoleColor]::DarkMagenta; ExpectedForeground = 35 },
            @{ Foreground = [ConsoleColor]::DarkYellow; ExpectedForeground = 33 },
            @{ Foreground = [ConsoleColor]::Gray; ExpectedForeground = 37 },
            @{ Foreground = [ConsoleColor]::DarkGray; ExpectedForeground = 90 },
            @{ Foreground = [ConsoleColor]::Blue; ExpectedForeground = 94 },
            @{ Foreground = [ConsoleColor]::Green; ExpectedForeground = 92 },
            @{ Foreground = [ConsoleColor]::Cyan; ExpectedForeground = 96 },
            @{ Foreground = [ConsoleColor]::Red; ExpectedForeground = 91 },
            @{ Foreground = [ConsoleColor]::Magenta; ExpectedForeground = 95 },
            @{ Foreground = [ConsoleColor]::Yellow; ExpectedForeground = 93 },
            @{ Foreground = [ConsoleColor]::White; ExpectedForeground = 97 }
        ) {
            param ( $Foreground, $ExpectedForeground )

            $sequence = New-VTSequence 'text' -Foreground $Foreground

            $sequence | Should -Be "$([char]0x1B)`[0;$($ExpectedForeground)mtext$([char]0x1B)`[0m"
        }

        It 'formats the input with a foreground color name of <Foreground>' -TestCases @(
            @{ Foreground = 'Black'; ExpectedForeground = 30 },
            @{ Foreground = 'DarkBlue'; ExpectedForeground = 34 },
            @{ Foreground = 'DarkGreen'; ExpectedForeground = 32 },
            @{ Foreground = 'DarkCyan'; ExpectedForeground = 36 },
            @{ Foreground = 'DarkRed'; ExpectedForeground = 31 },
            @{ Foreground = 'DarkMagenta'; ExpectedForeground = 35 },
            @{ Foreground = 'DarkYellow'; ExpectedForeground = 33 },
            @{ Foreground = 'Gray'; ExpectedForeground = 37 },
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

            $sequence = New-VTSequence 'text' -Foreground $Foreground

            $sequence | Should -Be "$([char]0x1B)`[0;$($ExpectedForeground)mtext$([char]0x1B)`[0m"
        }

        It 'formats the input with a valid RGB triplet' {
            $sequence = New-VTSequence text -Foreground 100, 150, 200

            $sequence | Should -Be "$([char]0x1B)`[0;38;2;100;150;200mtext$([char]0x1B)`[0m"
        }

        It 'throws when using fewer than 3 values for the color' {
            $sequence = { New-VTSequence text -Foreground 100, 150 }

            $sequence | Should -Throw
        }

        It 'throws when passing more than 3 values for an RGB foreground' {
            $sequence = { New-VTSequence text -Foreground 1, 2, 3, 4 }

            $sequence | Should -Throw
        }

        It 'throws when any value is outside the 0-255 byte range' -TestCases @(
            @{ Rgb = -1,0,0 },
            @{ Rgb = 0,-1,0 },
            @{ Rgb = 0,0,-1 },
            @{ Rgb = 256,0,0 },
            @{ Rgb = 0,256,0 },
            @{ Rgb = 0,0,256 }
        ) {
            param ( $Rgb )

            $sequence = { New-VTSequence text -Foreground $Rgb }

            $sequence | Should -Throw
        }

        It 'formats the input with a valid hex string' {
            $sequence = New-VTSequence text -Foreground FFFFFF

            $sequence | Should -Be "$([char]0x1B)`[0;38;2;255;255;255mtext$([char]0x1B)`[0m"
        }

        It 'throws when the input is an unusable color format' {
            $sequence = { New-VTSequence text -Foreground notanything }

            $sequence | Should -Throw
        }
    }
}
