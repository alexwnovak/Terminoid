function Push-BarSegment {
    param (
        [Parameter( Mandatory, Position = 0 )]
        [ConsoleColor]
        $BackgroundColor,

        [Parameter( Mandatory, Position = 1)]
        [ConsoleColor]
        $ForegroundColor,

        [Parameter( Mandatory, Position = 2, ParameterSetName = 'WithText' )]
        [string]
        $Text,

        [Parameter( Mandatory, Position = 2, ParameterSetName = 'WithFunction' )]
        [scriptblock]
        $Function,

        [Parameter( Position = 3 )]
        $Tag
    )

    if ( $PSBoundParameters.ContainsKey( 'Text' ) ) {
        $Function = { $Text }.GetNewClosure()
    }

    $BarSegments.Add( @{
        'BackgroundColor' = $BackgroundColor;
        'ForegroundColor' = $ForegroundColor;
        'Function' = $Function;
        'Tag' = $Tag
    } )
}
