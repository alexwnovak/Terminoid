. $PSScriptRoot\Shared.ps1

Describe 'Start-Item' {
    It 'uses Start-Process to start the item' {
        Set-DefaultStartHandler -Function {
            param ( $ItemName )
            $script:ActualItem = $ItemName
        }

        Start-Item 'SomeItem.txt'

        $script:ActualItem | Should -Be 'SomeItem.txt'
    }
}
