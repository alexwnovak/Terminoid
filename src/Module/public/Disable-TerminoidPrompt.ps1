function Disable-TerminoidPrompt {
    Set-Item Function:\prompt -Value $script:DefaultPrompt
}
