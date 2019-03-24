. $PSScriptRoot\Shared.ps1

Describe 'Format-ChildItem' {
    BeforeEach {
        Reset-GlobalState
    }

    It 'passes the object through the pipeline if there are no formatters' {
        $filteredOutput = @(1,2,3) | Format-ChildItem

        $filteredOutput[0] | Should -Be 1
        $filteredOutput[1] | Should -Be 2
        $filteredOutput[2] | Should -Be 3
    }

    It 'is filtered by a formatter' {
        Register-ChildItemFormatter -Predicate { $true } -Function {
            param ( $Object )

            "Filtered $Object"
        }

        $filteredOutput = @(1,2,3) | Format-ChildItem

        $filteredOutput[0] | Should -Be 'Filtered 1'
        $filteredOutput[1] | Should -Be 'Filtered 2'
        $filteredOutput[2] | Should -Be 'Filtered 3'
    }

    It 'only uses the single formatter that matches' {
        $predicate = [scriptblock] {
            param ( $Object )
            $Object -eq 2
        }

        $function = [scriptblock] {
            param ( $Object )
            "Filtered $Object"
        }

        Register-ChildItemFormatter -Predicate $predicate -Function $function

        $filteredOutput = @(1,2,3) | Format-ChildItem

        $filteredOutput[0] | Should -Be 1
        $filteredOutput[1] | Should -Be 'Filtered 2'
        $filteredOutput[2] | Should -Be 3
    }
}
