function FormatText( $Part ) {
    $copy = $Part.Clone()
    $copy.Text = " $($copy.Text) "

    $copy
}

function WriteSinglePart( $BarSegment ) {
    $copy = FormatText $BarSegment
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
            $bar = FormatText $Parts[$i].Clone()
            $statusBar += Format-Output @bar

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
