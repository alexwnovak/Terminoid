function Push-BarSegment {
    param (
        [Parameter( Mandatory )]
        [byte[]]
        $BackgroundColor,

        [Parameter( Mandatory )]
        [byte[]]
        $ForegroundColor,

        [Parameter( Mandatory, ParameterSetName = 'WithText' )]
        [string]
        $Text,

        [Parameter( Mandatory, ParameterSetName = 'WithFunction' )]
        [scriptblock]
        $Function,

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
