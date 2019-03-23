function Format-ChildItem {
    param (
        [Parameter( ValueFromPipeline )]
        $InputObject
    )

    process {
        $InputObject
    }
}
