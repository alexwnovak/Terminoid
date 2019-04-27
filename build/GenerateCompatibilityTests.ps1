param (
    [Parameter( Mandatory )]
    [string]
    $Psd1File,

    [Parameter( Mandatory )]
    [string]
    $OutputPath
)

$script:IndentationLevel = 0
$script:IndentSpaces = 4
$script:ModuleName = [System.IO.Path]::GetFileNameWithoutExtension( $Psd1File )

function Push-Indentation {
    $script:IndentationLevel++
}

function Pop-Indentation {
    if ( $script:IndentationLevel -ge 0 ) {
        $script:IndentationLevel--
    }
}

function Write-Indented( $Text ) {
    $leading = ' ' * ($script:IndentationLevel * $script:IndentSpaces)
    "$leading$Text"
}

function Write-FunctionNameTests {
    Write-Indented "Describe 'Function names' {"

    Push-Indentation
    Write-Indented "Context 'The module exposes only the expected functions' {"

    Push-Indentation

    $commands = Get-Command -Module $ModuleName

    Write-Indented "It 'exposes exactly $($commands.Count) commands' {"

    Push-Indentation
    Write-Indented "(Get-Command -Module $ModuleName).Count | Should -Be $($commands.Count)"
    Pop-Indentation

    Write-Indented "}"
    Pop-Indentation

    Write-Indented "}"
    Pop-Indentation

    Write-Indented "}"
}

Import-Module $Psd1File -Force

Write-FunctionNameTests | Out-File $OutputPath\FunctionNames.Tests.ps1
