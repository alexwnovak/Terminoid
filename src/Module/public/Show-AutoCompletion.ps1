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
    $items = 1, 2, 3

    $cursor = GetCursorLocation

    $x = $cursor.Left
    $y = $cursor.Top + 1

    $viewport = Get-Viewport

    if ( $y -gt $viewport.Height / 2 ) {
        $y -= 11
    }

    $selectedIndex = ShowMenu $items $x $y

    if ( $selectedIndex -ne -1 ) {
        $selectedItem = $items[$selectedIndex]
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert( $selectedItem )
    }
}
