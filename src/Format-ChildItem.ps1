function Format-ChildItem {
    param (
        [Parameter( ValueFromPipeline )]
        $InputObject
    )

    process {
        foreach ( $formatter in $FormatterTable ) {
            $match = & $FormatterTable.Predicate

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
