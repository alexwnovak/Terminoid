function WriteSinglePart( $BarSegment ) {
    $block = Format-Output " $($BarSegment.Text) " `
        -Background $BarSegment.Background `
        -Foreground $BarSegment.Foreground `
        -Bold:$BarSegment.Bold `
        -Italic:$BarSegment.Italic `
        -Underline:$BarSegment.Underline

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

    if ( $Parts.Count -eq 1 ) {
        $statusBar = WriteSinglePart $Parts[0]
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
