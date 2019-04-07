. $PSScriptRoot\Shared.ps1

Describe 'Set-Location' {
    BeforeEach {
        $oldPwd = $PWD

        Clear-LocationHistory
        Get-EventSubscriber -SourceIdentifier Terminoid.LocationChanged -ErrorAction SilentlyContinue | Unregister-Event
    }

    AfterEach {
        Microsoft.PowerShell.Management\Set-Location $oldPwd
    }

    It 'navigates to the new location' {
        New-Item TestDrive:\SetLocation_SettingTheLocation -ItemType Directory

        Set-Location -Path TestDrive:\SetLocation_SettingTheLocation

        $PWD | Should -Be 'TestDrive:\SetLocation_SettingTheLocation'
    }

    It 'raises an event with the new location' {
        New-Item TestDrive:\SetLocation_AnEventShouldBeRaised -ItemType Directory

        Register-EngineEvent Terminoid.LocationChanged -Action {
            Set-Content TestDrive:\NewLocation.txt $Event.MessageData
        }

        Set-Location -Path TestDrive:\SetLocation_AnEventShouldBeRaised

        Get-Content TestDrive:\NewLocation.txt | Should -BeLike '*\SetLocation_AnEventShouldBeRaised'
    }

    It 'records the destination to location history' {
        New-Item TestDrive:\SetLocation_TheLocationShouldBeRecorded -ItemType Directory

        Set-Location -Path 'TestDrive:\SetLocation_TheLocationShouldBeRecorded'

        Get-LocationHistory | Should -BeLike '*\SetLocation_TheLocationShouldBeRecorded'
    }
}
