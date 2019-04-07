. $PSScriptRoot\Shared.ps1

InModuleScope 'Terminoid' {
    Describe 'Push-Location' {
        Mock ConvertTo-FullPath { }

        BeforeEach {
            Get-EventSubscriber -SourceIdentifier Terminoid.LocationChanged -ErrorAction SilentlyContinue | Unregister-Event
        }

        Context 'Setting the location' {
            Mock Push-LocationInternal { }

            It 'sets the new location' {
                Terminoid\Push-Location -Path 'new-location'
                Assert-MockCalled Push-LocationInternal -ParameterFilter { $Path -eq 'new-location' }
            }
        }

        Context 'An event should be raised after navigation' {
            Mock Push-LocationInternal { }
            Mock ConvertTo-FullPath { 'C:\new-location' }

            It 'raises an event with the new fully-qualified path' {
                Register-EngineEvent Terminoid.LocationChanged -Action {
                    Set-Content TestDrive:\PushLocation-NewLocation.txt $Event.MessageData
                }

                Terminoid\Push-Location -Path 'new-location'

                Get-Content TestDrive:\PushLocation-NewLocation.txt | Should -Be 'C:\new-location'
            }
        }
    }
}
