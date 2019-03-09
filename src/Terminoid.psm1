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

Export-ModuleMember -Function Push-BarSegment
Export-ModuleMember -Function Write-Color
Export-ModuleMember -Function Write-StatusBar
Export-ModuleMember -Variable BarSegments

#Export-ModuleMember @exportModuleMemberParams
