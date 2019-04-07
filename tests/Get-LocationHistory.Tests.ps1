. $PSScriptRoot\Shared.ps1

Describe 'Get-LocationHistory' {
    BeforeEach {
        $oldPwd = $PWD
        Clear-LocationHistory
    }

    AfterEach {
        Microsoft.PowerShell.Management\Set-Location $oldPwd
    }

    It 'returns the location history' {
        New-Item TestDrive:\GetLocationHistory-One -ItemType Directory
        New-Item TestDrive:\GetLocationHistory-Two -ItemType Directory
        New-Item TestDrive:\GetLocationHistory-Three -ItemType Directory

        Set-Location TestDrive:\GetLocationHistory-One
        Set-Location TestDrive:\GetLocationHistory-Two
        Set-Location TestDrive:\GetLocationHistory-Three

        $history = Get-LocationHistory

        $history | Should -HaveCount 3
        $history[0] | Should -BeLike '*\GetLocationHistory-One'
        $history[1] | Should -BeLike '*\GetLocationHistory-Two'
        $history[2] | Should -BeLike '*\GetLocationHistory-Three'
    }
}
