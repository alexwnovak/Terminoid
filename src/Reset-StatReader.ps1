function Reset-StatReader {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute( 'PSUseShouldProcessForStateChangingFunctions', '' )]
    param ()

    $StatReaderTable.Clear()
    Register-FileStatReader -Extension '.bmp' -Function ${function:Get-ImageStats}
    Register-FileStatReader -Extension '.gif' -Function ${function:Get-ImageStats}
    Register-FileStatReader -Extension '.jpeg' -Function ${function:Get-ImageStats}
    Register-FileStatReader -Extension '.jpg' -Function ${function:Get-ImageStats}
    Register-FileStatReader -Extension '.png' -Function ${function:Get-ImageStats}
}
