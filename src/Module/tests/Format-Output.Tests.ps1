. $PSScriptRoot\Shared.ps1

Describe 'Format-Output' {
    It 'writes unformatted text when omitting all color information' {
        Format-Output 'text' | Should -Be 'text'
    }

    It 'formats a list of piped inputs' {
        $formattedOutput = @('text') | Format-Output -Foreground White -Background DarkGray

        $formattedOutput | Should -Be "$([char]0x1B)`[0;97;100mtext$([char]0x1B)`[0m"
    }

    It 'can underline the input' {
        Format-Output text -Underline | Should -Be "$([char]0x1B)`[0;4mtext$([char]0x1B)`[0m"
    }
}
