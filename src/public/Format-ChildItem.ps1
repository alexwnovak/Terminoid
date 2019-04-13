function Format-ChildItem {
    param (
        [Parameter( ValueFromPipeline )]
        $InputObject
    )

    process {
        $foundMatch = $false

        foreach ( $formatter in $script:FormatterTable ) {
            $match = & $formatter.Predicate $InputObject

            if ( $match ) {
                & $formatter.Function $InputObject
                $foundMatch = $true
                break
            }
        }

        if ( -not $foundMatch ) {
            $InputObject
        }
    }
}
