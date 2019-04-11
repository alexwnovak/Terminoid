. $PSScriptRoot\Shared.ps1

Describe 'Push-Location' {
    BeforeEach {
        $oldPwd = $PWD

        Clear-LocationHistory
        Get-EventSubscriber -SourceIdentifier Terminoid.LocationChanged -ErrorAction SilentlyContinue | Unregister-Event
    }

    AfterEach {
        Microsoft.PowerShell.Management\Set-Location $oldPwd
    }

    It 'navigates to the new location' {
        New-Item TestDrive:\PushLocation_SettingTheLocation -ItemType Directory

        Push-Location -Path TestDrive:\PushLocation_SettingTheLocation

        $PWD | Should -Be 'TestDrive:\PushLocation_SettingTheLocation'
    }

    It 'raises an event with the new location' {
        New-Item TestDrive:\PushLocation_AnEventShouldBeRaised -ItemType Directory

        Register-EngineEvent Terminoid.LocationChanged -Action {
            Set-Content TestDrive:\NewLocation.txt $Event.MessageData
        }

        Push-Location -Path TestDrive:\PushLocation_AnEventShouldBeRaised

        Get-Content TestDrive:\NewLocation.txt | Should -BeLike '*\PushLocation_AnEventShouldBeRaised'
    }

    It 'records the destination to location history' {
        New-Item TestDrive:\PushLocation_TheLocationShouldBeRecorded -ItemType Directory

        Push-Location -Path 'TestDrive:\PushLocation_TheLocationShouldBeRecorded'

        Get-LocationHistory | Should -BeLike '*\PushLocation_TheLocationShouldBeRecorded'
    }
}
