function Push-BarSegment {
    param (
        [Parameter( Mandatory )]
        $Foreground,

        [Parameter( Mandatory )]
        $Background,

        [switch]
        $Italic,

        [Parameter( Mandatory, ParameterSetName = 'WithText' )]
        [string]
        $Text,

        [Parameter( Mandatory, ParameterSetName = 'WithFunction' )]
        [scriptblock]
        $Function,

        $Tag
    )

    ValidateColor $Foreground
    ValidateColor $Background

    if ( $PSBoundParameters.ContainsKey( 'Text' ) ) {
        $Function = { $Text }.GetNewClosure()
    }

    [void] $script:BarSegments.Add( @{
        'BackgroundColor' = $Background
        'ForegroundColor' = $Foreground
        'Italic' = $Italic
        'Function' = $Function
        'Tag' = $Tag
    } )
}
