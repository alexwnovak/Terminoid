. $PSScriptRoot\Shared.ps1

Describe 'Enable-Prompt' {
    BeforeEach {
        $script:DefaultPrompt = (Get-Item Function:\prompt).ScriptBlock
    }

    AfterEach {
        Set-Item Function:\prompt $script:DefaultPrompt
    }

    It 'can replace the default prompt' {
        $defaultPrompt = (Get-Item Function:\prompt).ScriptBlock

        Enable-TerminoidPrompt

        $newPrompt = (Get-Item Function:\prompt).ScriptBlock

        $newPrompt | Should -Not -Be $defaultPrompt
    }

    It 'can be restored to its original state' {
        $defaultPrompt = (Get-Item Function:\prompt).ScriptBlock

        Enable-TerminoidPrompt
        Disable-TerminoidPrompt

        $newPrompt = (Get-Item Function:\prompt).ScriptBlock

        $newPrompt | Should -Be $defaultPrompt
    }
}
