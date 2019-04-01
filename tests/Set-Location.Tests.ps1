
. $PSScriptRoot\Shared.ps1

InModuleScope 'Terminoid' {

    Describe 'Set-Location' {
        BeforeEach {
            $LocationHistory.Clear()
        }

        Context 'when setting the location' {
            Mock Set-LocationInternal { }

            It 'sets the new location' {
                Terminoid\Set-Location -Path 'new-location'
                Assert-MockCalled Set-LocationInternal -ParameterFilter { $Path -eq 'new-location' }
            }
        }

        Context 'records the new location after successfully navigating there' {
            Mock Set-LocationInternal { $LocationHistory.Count | Should -Be 0 }

            It 'records the new location' {
                Terminoid\Set-Location -Path 'new-location'
                $LocationHistory | Should -Contain 'new-location'
            }
        }
    }
}
