function Push-BarSegment {
    param (
        [ConsoleColor]
        $BackgroundColor,

        [ConsoleColor]
        $ForegroundColor,

        [string]
        $Text
    )

    $BarSegments.Add( @{
        'BackgroundColor' = $BackgroundColor;
        'ForegroundColor' = $ForegroundColor;
        'Function' = { $Text }.GetNewClosure()
    } )
}
