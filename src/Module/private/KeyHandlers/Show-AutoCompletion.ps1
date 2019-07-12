function Show-AutoCompletion {
    $items = @(
        'first',
        'second',
        'third',
        'fourth',
        'fifth',
        'sixth',
        'seventh',
        'eighth',
        'ninth',
        'tenth',
        'eleventh',
        'twelfth',
        'thirteenth',
        'fourteenth',
        'fifteenth'
    )

    $menu = [Terminoid.Menu]::new( $items )
    $menu.SelectionIndicator = [char] 0xE602

    $x = [Console]::CursorLeft
    $y = [Console]::CursorTop + 1

    $viewport = Get-Viewport

    if ( $y -gt $viewport.Height / 2 ) {
        $y -= 10
    }

    $selectedIndex = $menu.Show( $x, $y )

    if ( $selectedIndex -ne -1 ) {
        $selectedItem = $items[$selectedIndex]
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert( $selectedItem )
    }
}
