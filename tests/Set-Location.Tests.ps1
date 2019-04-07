. $PSScriptRoot\Shared.ps1

InModuleScope 'Terminoid' {
    Describe 'Set-Location' {
        Mock ConvertTo-FullPath { }

        BeforeEach {
            Clear-LocationHistory
            Get-EventSubscriber -SourceIdentifier Terminoid.LocationChanged -ErrorAction SilentlyContinue | Unregister-Event
        }

        Context 'Setting the location' {
            Mock Set-LocationInternal { }

            It 'sets the new location' {
                Terminoid\Set-Location -Path 'new-location'
                Assert-MockCalled Set-LocationInternal -ParameterFilter { $Path -eq 'new-location' }
            }
        }

        Context 'An event should be raised after navigation' {
            Mock Set-LocationInternal { }
            Mock ConvertTo-FullPath { 'C:\new-location' }

            It 'raises an event with the new fully-qualified path' {
                Register-EngineEvent Terminoid.LocationChanged -Action {
                    Set-Content TestDrive:\NewLocation.txt $Event.MessageData
                }

                Terminoid\Set-Location -Path 'new-location'

                Get-Content TestDrive:\NewLocation.txt | Should -Be 'C:\new-location'
            }
        }

        Context 'The location should be recorded' {
            Mock Set-LocationInternal { $LocationHistory.Count | Should -Be 0 }
            Mock ConvertTo-FullPath { 'C:\new-location' }

            It 'records the new location' {
                Terminoid\Set-Location -Path 'new-location'
                Get-LocationHistory | Should -Contain 'C:\new-location'
            }
        }
    }
}
