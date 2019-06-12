function Push-BarSegment {
    param (
        [Parameter( Mandatory )]
        $Foreground,

        [Parameter( Mandatory )]
        $Background,

        [switch]
        $Bold,

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
        'Bold' = $Bold
        'Italic' = $Italic
        'Function' = $Function
        'Tag' = $Tag
    } )
}
