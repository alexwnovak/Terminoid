function Register-ChildItemFormatter {
    param (
        [Parameter( Mandatory, Position = 0 )]
        [scriptblock]
        $Predicate,

        [Parameter( Mandatory, Position = 1 )]
        [scriptblock]
        $Function
    )

    $script:FormatterTable.Push( @{
        Predicate = $Predicate;
        Function = $Function;
    } )
}
