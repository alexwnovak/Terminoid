Get-ChildItem $PSScriptRoot\*.ps1 | ForEach-Object { . $_ }

[System.Collections.ArrayList] $BarSegments = @()
[System.Collections.ArrayList] $LocationHistory = @()
$FormatterTable = New-Object System.Collections.Stack

$DefaultStatReader = $function:DefaultFileStatReader

[System.Collections.ArrayList] $StatReaderTable = @()
Reset-StatReader

Export-ModuleMember -Function Disable-Cursor
Export-ModuleMember -Function Enable-Cursor
Export-ModuleMember -Function Format-ChildItem
Export-ModuleMember -Function Format-Date
Export-ModuleMember -Function Format-Output
Export-ModuleMember -Function Format-Size
Export-ModuleMember -Function Get-FileStatistics
Export-ModuleMember -Function Push-BarSegment
Export-ModuleMember -Function Register-ChildItemFormatter
Export-ModuleMember -Function Reset-DefaultFileStatReader
Export-ModuleMember -Function Reset-StatReader
Export-ModuleMember -Function Register-FileStatReader
Export-ModuleMember -Function Set-Location
Export-ModuleMember -Function Set-DefaultFileStatReader
Export-ModuleMember -Function Write-Color
Export-ModuleMember -Function Write-StatusBar
Export-ModuleMember -Variable BarSegments
Export-ModuleMember -Variable DefaultStatReader
Export-ModuleMember -Variable LocationHistory
Export-ModuleMember -Variable FormatterTable
Export-ModuleMember -Variable StatReaderTable
