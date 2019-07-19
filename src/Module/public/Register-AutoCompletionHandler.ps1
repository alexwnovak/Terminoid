function Register-AutoCompletionHandler {
    param (
        [scriptblock]
        $Predicate,

        [scriptblock]
        $Function
    )

    $handler = @{
        Predicate = $Predicate
        Function = $Function
    }

    $script:AutoCompletionTable.Add( $handler )
}
