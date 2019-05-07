function Register-StartHandler {
    param (
        [scriptblock]
        $Predicate,

        [scriptblock]
        $Function
    )

    $script:StartHandlerTable.Add( @{
        Predicate = $Predicate;
        Function = $Function
    } )
}
