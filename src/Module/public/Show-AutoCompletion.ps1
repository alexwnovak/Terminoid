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

    if ( -not ($items -is [Array]) ) {
        $items = @($items)
    }

    $cursor = GetCursorLocation

    $x = $cursor.Left
    $y = 0

    $viewport = Get-Viewport

    if ( $cursor.Top -lt $viewport.BufferHeight - $viewport.Height / 2 ) {
        $y = $cursor.Top + 1
    } else {
        $y = $cursor.Top - 10
    }

    $selectedIndex = ShowMenu $items $x $y

    if ( $selectedIndex -ne -1 ) {
        $items[$selectedIndex]
    }
}
