. $PSScriptRoot\Shared.ps1

Describe 'Start-Item' {
    BeforeEach {
        Reset-StartHandler
    }

    It 'uses the default handler to start the item' {
        $actualItem = ''

        Set-DefaultStartHandler -Function {
            param ( $Item )
            Set-Variable actualItem -Scope 1 -Value $Item
        }

        Start-Item -Item 'SomeItem.txt'

        $actualItem | Should -Be 'SomeItem.txt'
    }

    It 'uses a custom registered handler to start the item' {
        $actualItem = ''

        Register-StartHandler -Predicate { param ( $Item ) $Item -eq 'Test.item' } -Function {
            param ( $Item )
            Set-Variable actualItem -Scope 1 -Value $Item
        }

        Start-Item -Item 'Test.item'

        $actualItem | Should -Be 'Test.item'
    }

    It 'does not use the default handler if a custom handler responds' {
        Set-DefaultStartHandler -Function { throw 'Default handler should not be called' }

        Register-StartHandler -Predicate { param ( $Item ) $Item -eq 'Test.item' } -Function { }

        { Start-Item -Item 'Test.item' } | Should -Not -Throw
    }

    It 'uses the first matched handler' {
        Set-DefaultStartHandler -Function { throw 'Default handler should not be called' }

        $actualItem = ''

        Register-StartHandler -Predicate { param ( $Item ) $Item -eq 'Test.item' } -Function {
            param ( $Item )
            Set-Variable actualItem -Scope 1 -Value 'first match'
        }

        Register-StartHandler -Predicate { param ( $Item ) $Item -eq 'Test.item' } -Function {
            param ( $Item )
            Set-Variable actualItem -Scope 1 -Value 'second match'
        }

        Start-Item -Item 'Test.item'

        $actualItem | Should -Be 'first match'
    }

    It 'does not wait by default' {
        $waiting = $false

        Set-DefaultStartHandler -Function {
            param ( $Item, $Wait )
            Set-Variable waiting -Scope 1 -Value $Wait
        }

        Start-Item -Item 'doesnt-matter'

        $waiting | Should -Be $false
    }

    It 'waits for the operation to complete' {
        $waiting = $false

        Set-DefaultStartHandler -Function {
            param ( $Item, $Wait )
            Set-Variable waiting -Scope 1 -Value $Wait
        }

        Start-Item -Item 'doesnt-matter' -Wait

        $waiting | Should -Be $true
    }
}
