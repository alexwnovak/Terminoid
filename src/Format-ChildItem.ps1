function Format-ChildItem {
    param (
        [Parameter( ValueFromPipeline )]
        $InputObject
    )

    process {
        $foundMatch = $false

        foreach ( $formatter in $FormatterTable ) {
            $match = & $FormatterTable.Predicate $InputObject

            if ( $match ) {
                & $FormatterTable.Function $InputObject
                $foundMatch = $true
            }
        }

        if ( -not $foundMatch ) {
            $InputObject
        }
    }
}
