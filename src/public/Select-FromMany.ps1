$KeyEnter = 13
$KeyEscape = 27
$KeyUp = 38
$KeyDown = 40
$e = [char] 0x1B

function RenderChoices( $Choices, $Indicator ) {
    $spacing = ' ' * ($Indicator.Length + 1)

    for ( $i = 0; $i -lt $Choices.Count; $i++ ) {
        if ( $i -eq $selectedItem ) {
            "$Indicator $($Choices[$i])" | Out-Host
        } else {
            "$spacing$($Choices[$i])" | Out-Host
        }
    }
}

function Select-FromMany {
    param (
        $Choices,
        $Indicator = '*'
    )

    Hide-Cursor | Out-Host

    $selectedItem = 0
    $exit = $false
    $returnValue = $false

    # Initial render to establish the vertical spacing. On subsequent renders (after
    # input), we'll use a VT sequence to back the cursor up to re-render OVER this

    RenderChoices $Choices $Indicator

    while ( -not $exit ) {
        # Input phase

        $key = Read-Key

        switch ( $key ) {
            $KeyEnter { $returnValue = $Choices[$selectedItem]; $exit = $true }
            $KeyEscape { $returnValue = $null; $exit = $true }
            $KeyDown { $selectedItem = ($selectedItem + 1) % $Choices.Count }
            $KeyUp { $selectedItem = ($selectedItem + ($Choices.Count - 1)) % $Choices.Count }
        }

        if ( $exit ) {
            break
        }

        # Draw phase

        "$e[$($Choices.Count + 1)A" | Out-Host
        RenderChoices $Choices $Indicator
    }

    Show-Cursor | Out-Host
    $returnValue
}
