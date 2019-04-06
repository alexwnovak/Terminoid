function Reset-StatReader {
    $global:StatReaderTable = @()
    Register-FileStatReader -Extension '.bmp' -Function ${function:Get-ImageStats}
    Register-FileStatReader -Extension '.gif' -Function ${function:Get-ImageStats}
    Register-FileStatReader -Extension '.jpeg' -Function ${function:Get-ImageStats}
    Register-FileStatReader -Extension '.jpg' -Function ${function:Get-ImageStats}
    Register-FileStatReader -Extension '.png' -Function ${function:Get-ImageStats}
}
