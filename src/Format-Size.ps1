$SizeTable = @(1PB, 1TB, 1GB, 1MB, 1KB)
$LabelTable = @('PB', 'TB', 'GB', 'MB', 'KB')

function Format-Size {
    param (
        [Parameter( Mandatory )]
        [long]
        $Size
    )

    for ( $index = 0; $index -lt $SizeTable.Length; $index++ ) {
        if ( $Size -gt $SizeTable[$index] ) {
            $unitSize = $Size / $SizeTable[$index]

            if ( $unitSize -ge 10 ) {
                $unitSize = [Math]::Round( $unitSize, 0 )
            } else {
                $unitSize = [Math]::Round( $unitSize, 1 )
            }

            "$unitSize $($LabelTable[$index])"
            return
        }
    }

    "$Size B"
}
