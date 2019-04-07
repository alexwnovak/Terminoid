. $PSScriptRoot\Shared.ps1

Describe 'Clear-LocationHistory' {
    BeforeEach {
        $oldPwd = $PWD
    }

    AfterEach {
        Microsoft.PowerShell.Management\Set-Location $oldPwd
    }

    It 'removes all history items' {
        New-Item TestDrive:\ClearLocationHistory-One -ItemType Directory
        New-Item TestDrive:\ClearLocationHistory-Two -ItemType Directory
        New-Item TestDrive:\ClearLocationHistory-Three -ItemType Directory

        Set-Location TestDrive:\ClearLocationHistory-One
        Set-Location TestDrive:\ClearLocationHistory-Two
        Set-Location TestDrive:\ClearLocationHistory-Three

        Get-LocationHistory | Should -HaveCount 3

        Clear-LocationHistory

        Get-LocationHistory | Should -BeNullOrEmpty
    }
}
