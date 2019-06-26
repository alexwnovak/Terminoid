function Format-Join {
    param (
        $InputObject,
        $Property = 'Text'
    )

    $output = ''

    foreach ( $item in $InputObject ) {
        if ( $item -is [Hashtable] ) {
            $output += Format-Output $item
        } else {
            $output += $item
        }
    }

    $output
}
