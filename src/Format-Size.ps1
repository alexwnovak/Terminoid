function Format-Size {
    param (
        [Parameter( Mandatory )]
        [long]
        $Size
    )

    if ( $Size -gt 1PB ) {
        "$($Size / 1PB) PB"
    } elseif ( $Size -gt 1TB ) {
        "$($Size / 1TB) TB"
    } elseif ( $Size -gt 1GB ) {
        "$($Size / 1GB) GB"
    } elseif ( $Size -gt 1MB ) {
        "$($Size / 1MB) MB"
    } elseif ( $Size -gt 1KB ) {
        "$($Size / 1KB) KB"
    } else {
        "$Size B"
    }
}