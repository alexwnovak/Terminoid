function DefaultPromptFormatter( $Parts ) {
    '> '
}

function Reset-PromptFormatter {
    $script:PromptFormatter = $function:DefaultPromptFormatter
}
