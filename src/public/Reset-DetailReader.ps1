function Reset-DetailReader {
    [CmdletBinding( SupportsShouldProcess )]
    param ()

    if ( $PSCmdlet.ShouldProcess( 'Resetting the built-in file detail readers' ) ) {
        $script:DetailReaderTable = [List[Hashtable]]::new()
        Register-FileDetailReader -Extension '.bmp' -Function ${function:Get-ImageDetail}
        Register-FileDetailReader -Extension '.gif' -Function ${function:Get-ImageDetail}
        Register-FileDetailReader -Extension '.jpeg' -Function ${function:Get-ImageDetail}
        Register-FileDetailReader -Extension '.jpg' -Function ${function:Get-ImageDetail}
        Register-FileDetailReader -Extension '.png' -Function ${function:Get-ImageDetail}
    }
}
