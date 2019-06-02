function WriteSingleSegment( $BarSegment ) {
    $block = Format-Output " $(& $BarSegment.Function) " `
                -Background $BarSegment.BackgroundColor `
                -Foreground $BarSegment.ForegroundColor  `

    $joinerChar = Get-SpecialChar -Type BarJoiner
    $joiner = Format-Output $joinerChar -Foreground $BarSegment.BackgroundColor

    "$block$joiner"
}

function Write-StatusBar {
    if ( $script:BarSegments.Count -eq 0 ) {
        return
    }

    $statusBar = ''

    if ( $script:BarSegments.Count -eq 1 ) {
        $statusBar = WriteSingleSegment $script:BarSegments[0]
    }
    else {
        $joinerChar = Get-SpecialChar -Type BarJoiner

        for ( $i = 0; $i -lt $script:BarSegments.Count; $i++ ) {
            $bar = $script:BarSegments[$i]

            $statusBar += Format-Output " $(& $bar.Function) " `
                -Background $bar.BackgroundColor `
                -Foreground $bar.ForegroundColor  `

            if ( $i -lt $script:BarSegments.Count - 1 ) {
                $nextBar = $script:BarSegments[$i + 1]

                $statusBar += Format-Output $JoinerChar `
                    -Background $nextBar.BackgroundColor  `
                    -Foreground $bar.BackgroundColor `
            }
        }

        $statusBar += Format-Output $JoinerChar -Foreground $script:BarSegments[$i - 1].BackgroundColor
    }

    "$($statusBar) "
}
