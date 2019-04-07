. $PSScriptRoot\Shared.ps1

InModuleScope 'Terminoid' {
    Describe 'Get-LocationHistory' {
        Mock Set-LocationInternal { }
        Mock ConvertTo-FullPath { param ( $Path ) $Path }

        BeforeEach {
            Clear-LocationHistory
        }

        It 'returns the location history' {
            Set-Location 'new-location-one'
            Set-Location 'new-location-two'
            Set-Location 'new-location-three'

            $history = Get-LocationHistory

            $history | Should -HaveCount 3
            $history[0] | Should -Be 'new-location-one'
            $history[1] | Should -Be 'new-location-two'
            $history[2] | Should -Be 'new-location-three'
        }
    }
}
