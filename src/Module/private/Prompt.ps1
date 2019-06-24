function TerminoidPrompt {
    $parts = @()

    foreach ( $handler in $script:PromptHandlers ) {
        $parts += & $handler
    }

    & $script:PromptFormatter $parts
}
