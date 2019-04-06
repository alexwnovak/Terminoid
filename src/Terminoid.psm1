Get-ChildItem $PSScriptRoot\*.ps1 | ForEach-Object { . $_ }

[System.Collections.ArrayList] $BarSegments = @()
[System.Collections.ArrayList] $LocationHistory = @()
$FormatterTable = New-Object System.Collections.Stack

Export-ModuleMember -Function Disable-Cursor
Export-ModuleMember -Function Enable-Cursor
Export-ModuleMember -Function Format-ChildItem
Export-ModuleMember -Function Format-Date
Export-ModuleMember -Function Format-Output
Export-ModuleMember -Function Format-Size
Export-ModuleMember -Function Get-FileStatistics
Export-ModuleMember -Function Push-BarSegment
Export-ModuleMember -Function Register-ChildItemFormatter
Export-ModuleMember -Function Set-Location
Export-ModuleMember -Function Write-Color
Export-ModuleMember -Function Write-StatusBar
Export-ModuleMember -Variable BarSegments
Export-ModuleMember -Variable LocationHistory
Export-ModuleMember -Variable FormatterTable
