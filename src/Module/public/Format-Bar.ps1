function Format-Bar {
    param (
        $Parts
    )

    if ( -not $Parts ) {
        return
    }

    if ( -not ($Parts -is [Array]) ) {
        $Parts = @($Parts)
    }

    $joinerChar = Get-SpecialChar -Type BarJoiner
    $statusBar = ''

    for ( $i = 0; $i -lt $Parts.Count; $i++ ) {
        $bar = $Parts[$i].Clone()
        $bar.Text = " $($Parts[$i].Text) "

        $statusBar += Format-Output @bar

        if ( $i -lt $Parts.Count - 1 ) {
            $nextBar = $Parts[$i + 1]

            $statusBar += Format-Output $JoinerChar `
                -Background $nextBar.Background  `
                -Foreground $bar.Background `
        }
    }

    $statusBar += Format-Output $JoinerChar -Foreground $Parts[$i - 1].Background
    "$($statusBar) "
}
