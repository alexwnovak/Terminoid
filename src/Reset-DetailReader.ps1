function Reset-DetailReader {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute( 'PSUseShouldProcessForStateChangingFunctions', '' )]
    param ()

    $script:DetailReaderTable.Clear()
    Register-FileDetailReader -Extension '.bmp' -Function ${function:Get-ImageDetail}
    Register-FileDetailReader -Extension '.gif' -Function ${function:Get-ImageDetail}
    Register-FileDetailReader -Extension '.jpeg' -Function ${function:Get-ImageDetail}
    Register-FileDetailReader -Extension '.jpg' -Function ${function:Get-ImageDetail}
    Register-FileDetailReader -Extension '.png' -Function ${function:Get-ImageDetail}
}
