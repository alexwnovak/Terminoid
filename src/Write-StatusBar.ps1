function WriteSingleSegment( $BarSegment ) {
    $block = Format-Output " $(& $BarSegment.Function) " `
                -Background $BarSegment.BackgroundColor `
                -Foreground $BarSegment.ForegroundColor  `

    $joiner = Format-Output $JoinerChar -Foreground $BarSegments[$i - 1].BackgroundColor

    "$block$joiner"
}

function Write-StatusBar {
    if ( $BarSegments.Count -eq 0 ) {
        return
    }
    elseif ( $BarSegments.Count -eq 1 ) {
        $statusBar = WriteSingleSegment $BarSegments[0]
    }
    else {
        for ( $i = 0; $i -lt $BarSegments.Count; $i++ ) {
            $bar = $BarSegments[$i]

            $statusBar += Format-Output " $(& $bar.Function) " `
                -Background $bar.BackgroundColor `
                -Foreground $bar.ForegroundColor  `

            if ( $i -lt $BarSegments.Count - 1 ) {
                $nextBar = $BarSegments[$i + 1]

                $statusBar += Format-Output $JoinerChar `
                    -Background $nextBar.BackgroundColor  `
                    -Foreground $bar.BackgroundColor `
            }
        }

        $statusBar += Format-Output $JoinerChar -Foreground $BarSegments[$i - 1].BackgroundColor
    }

    "$($statusBar) "
}
