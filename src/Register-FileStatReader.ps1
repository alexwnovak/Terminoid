function Register-FileStatReader {
    param (
        [string]
        $Extension,

        [scriptblock]
        $Function
    )

    $StatReaderTable.Add( @{
        Extension = $Extension;
        Function = $Function
    } )
}
