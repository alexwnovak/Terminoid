function WriteSinglePart( $BarSegment ) {
    $copy = $BarSegment.Clone()

    $copy.InputObject = " $($copy.Text) "
    $copy.Remove( 'Text' )
    $block = Format-Output @copy

    $joinerChar = Get-SpecialChar -Type BarJoiner
    $joiner = Format-Output $joinerChar -Foreground $BarSegment.Background

    "$block$joiner"
}

function Format-Bar {
    param (
        $Parts
    )

    if ( $Parts.Count -eq 0 ) {
        return
    }

    $statusBar = ''

    if ( -not ($Parts -is [Array]) ) {
        $statusBar = WriteSinglePart $Parts
    }
    else {
        $joinerChar = Get-SpecialChar -Type BarJoiner

        for ( $i = 0; $i -lt $Parts.Count; $i++ ) {
            $bar = $Parts[$i]

            $statusBar += Format-Output " $($bar.Text) " `
                -Background $bar.Background `
                -Foreground $bar.Foreground `
                -Bold:$bar.Bold `
                -Italic:$bar.Italic `
                -Underline:$bar.Underline

            if ( $i -lt $Parts.Count - 1 ) {
                $nextBar = $Parts[$i + 1]

                $statusBar += Format-Output $JoinerChar `
                    -Background $nextBar.Background  `
                    -Foreground $bar.Background `
            
            }
        }

        $statusBar += Format-Output $JoinerChar -Foreground $Parts[$i - 1].Background
    }

    "$($statusBar) "
}
