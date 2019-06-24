function Set-PromptFormatter {
    param (
        [scriptblock]
        $Function
    )

    $script:PromptFormatter = $Function
}
