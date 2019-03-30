. $PSScriptRoot\Format-ChildItem.ps1
. $PSScriptRoot\Format-Date.ps1
. $PSScriptRoot\Format-Output.ps1
. $PSScriptRoot\Format-Size.ps1
. $PSScriptRoot\Push-BarSegment.ps1
. $PSScriptRoot\Register-ChildItemFormatter.ps1
. $PSScriptRoot\Write-Color.ps1
. $PSScriptRoot\Write-StatusBar.ps1

[System.Collections.ArrayList] $BarSegments = @()
$FormatterTable = New-Object System.Collections.Stack

$exportModuleMemberParams = @{
    Function = @(
       'Push-BarSegment'
    )
    Variable = @(
       'BarSegments'
    )
}

Export-ModuleMember -Function Format-ChildItem
Export-ModuleMember -Function Format-Date
Export-ModuleMember -Function Format-Output
Export-ModuleMember -Function Format-Size
Export-ModuleMember -Function Push-BarSegment
Export-ModuleMember -Function Register-ChildItemFormatter
Export-ModuleMember -Function Write-Color
Export-ModuleMember -Function Write-StatusBar
Export-ModuleMember -Variable BarSegments
Export-ModuleMember -Variable FormatterTable

#Export-ModuleMember @exportModuleMemberParams
