function Enable-TerminoidPrompt {
    Set-Item Function:\prompt -Value ${function:TerminoidPrompt}
}
