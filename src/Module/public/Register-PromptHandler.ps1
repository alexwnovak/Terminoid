function Register-PromptHandler {
    param (
        [scriptblock]
        $Function
    )

    $script:PromptHandlers.Add( $Function )
}
