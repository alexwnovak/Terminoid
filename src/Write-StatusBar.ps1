function WriteJoiningSegment( $BarSegment ) {

}

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
        WriteSingleSegment $BarSegments[0]
        return
    }

    $joiner = [char]0xE0B0

    for ( $i = 0; $i -lt $BarSegments.Count; $i++ ) {
        $bar = $BarSegments[$i]

        Write-Color " $(& $bar.Function) " `
            -Background $bar.BackgroundColor `
            -Foreground $bar.ForegroundColor  `
            -NoNewline

        if ( $i -lt $BarSegments.Count - 1 ) {
            $nextBar = $BarSegments[$i + 1]

            Write-Color $joiner `
                -Background $nextBar.BackgroundColor  `
                -Foreground $bar.BackgroundColor `
                -NoNewline
        }
    }

    Write-Color $joiner -Foreground $BarSegments[$i - 1].BackgroundColor -NoNewline
}
