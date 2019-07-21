function GetCurrentInput {
    $currentInput = ''
    $discard = 0
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState( [ref] $currentInput, [ref] $discard )

    $currentInput
}

function GetCursorLocation {
    @{
        Left = [Console]::CursorLeft
        Top = [Console]::CursorTop
    }
}

function ShowMenu( $Items, $X, $Y ) {
    $menu = [Terminoid.Menu]::new( $Items )
    $menu.SelectionIndicator = '*'
    $menu.Show( $X, $Y )
}

function Show-AutoCompletion {
    $currentInput = GetCurrentInput
    $items = $null

    foreach ( $handler in $script:AutoCompletionTable ) {
        $match = & $handler.Predicate $currentInput

        if ( $match ) {
            $items = & $handler.Function $currentInput
        }
    }

    if ( -not $items ) {
        return
    }

    $cursor = GetCursorLocation

    $x = $cursor.Left
    $y = $cursor.Top + 1

    $viewport = Get-Viewport

    if ( $y -gt $viewport.Height / 2 ) {
        $y -= 11
    }

    $selectedIndex = ShowMenu $items $x $y

    if ( $selectedIndex -ne -1 ) {
        $items[$selectedIndex]
    }
}
