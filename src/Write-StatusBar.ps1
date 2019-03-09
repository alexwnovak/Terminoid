function Write-StatusBar {
    if ( $BarSegments.Count -eq 0 ) {
        return
    }

    Write-Color " $(& $BarSegments[0].Function) " `
        -Foreground $BarSegments[0].ForegroundColor `
        -Background $BarSegments[0].BackgroundColor `
        -NoNewline

    Write-Color "$([char]0xE0B0)" -Foreground $BarSegments[0].BackgroundColor
}
