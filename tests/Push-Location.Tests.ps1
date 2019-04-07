. $PSScriptRoot\Shared.ps1

InModuleScope 'Terminoid' {
    Describe 'Push-Location' {
        Context 'Setting the location' {
            Mock Push-LocationInternal { }

            It 'sets the new location' {
                Terminoid\Push-Location -Path 'new-location'
                Assert-MockCalled Push-LocationInternal -ParameterFilter { $Path -eq 'new-location' }
            }
        }
    }
}
