. $PSScriptRoot\Format-ChildItem.ps1
. $PSScriptRoot\Format-Color.ps1
. $PSScriptRoot\Push-BarSegment.ps1
. $PSScriptRoot\Write-Color.ps1
. $PSScriptRoot\Write-StatusBar.ps1

[System.Collections.ArrayList] $BarSegments = @()

$exportModuleMemberParams = @{
    Function = @(
       'Push-BarSegment'
    )
    Variable = @(
       'BarSegments'
    )
}

Export-ModuleMember -Function Format-ChildItem
Export-ModuleMember -Function Format-Color
Export-ModuleMember -Function Push-BarSegment
Export-ModuleMember -Function Write-Color
Export-ModuleMember -Function Write-StatusBar
Export-ModuleMember -Variable BarSegments

#Export-ModuleMember @exportModuleMemberParams
