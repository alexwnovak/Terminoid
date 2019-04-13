function Register-FileDetailReader {
    param (
        [string]
        $Extension,

        [scriptblock]
        $Function
    )

    $script:DetailReaderTable.Add( @{
        Extension = $Extension;
        Function = $Function
    } )
}
