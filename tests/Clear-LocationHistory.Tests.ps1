. $PSScriptRoot\Shared.ps1

InModuleScope 'Terminoid' {
    Mock Set-LocationInternal { }
    Mock ConvertTo-FullPath { param ( $Path ) $Path }

    Describe 'Clear-LocationHistory' {
        It 'removes all history items' {
            Set-Location 'new-location-one'
            Set-Location 'new-location-two'
            Set-Location 'new-location-three'

            Clear-History

            Get-LocationHistory | Should -BeNullOrEmpty
        }
    }
}
