Get-ChildItem $PSScriptRoot\*.ps1 | ForEach-Object { . $_ }

[System.Collections.ArrayList] $script:BarSegments = @()
[System.Collections.ArrayList] $script:LocationHistory = @()
$script:FormatterTable = New-Object System.Collections.Stack

$script:DefaultStatReader = $function:DefaultFileStatReader

$script:SpecialCharTable = @{
    Joiner = [char]0xE0B0
}

[System.Collections.ArrayList] $script:StatReaderTable = @()
Reset-DetailReader

New-Alias -Name stat -Value Get-FileStatistics

Export-ModuleMember -Function Clear-BarSegments
Export-ModuleMember -Function Clear-FormatterTable
Export-ModuleMember -Function Clear-LocationHistory
Export-ModuleMember -Function Format-ChildItem
Export-ModuleMember -Function Format-Date
Export-ModuleMember -Function Format-Output
Export-ModuleMember -Function Format-Size
Export-ModuleMember -Function Get-BarSegments
Export-ModuleMember -Function Get-FileDetail
Export-ModuleMember -Function Get-LocationHistory
Export-ModuleMember -Function Get-SpecialChar
Export-ModuleMember -Function Hide-Cursor
Export-ModuleMember -Function Pop-BarSegment
Export-ModuleMember -Function Push-BarSegment
Export-ModuleMember -Function Push-Location
Export-ModuleMember -Function Register-ChildItemFormatter
Export-ModuleMember -Function Reset-DefaultFileStatReader
Export-ModuleMember -Function Reset-DetailReader
Export-ModuleMember -Function Register-FileStatReader
Export-ModuleMember -Function Set-Location
Export-ModuleMember -Function Set-DefaultFileStatReader
Export-ModuleMember -Function Show-Cursor
Export-ModuleMember -Function Write-StatusBar
Export-ModuleMember -Alias stat
