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

$moduleFullPath = Resolve-Path $Psd1File
Push-Location (Resolve-Path $OutputPath)
$script:RelativeModulePath = Resolve-Path $moduleFullPath -Relative
Pop-Location

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
    Write-Indented "#=============================================================================="
    Write-Indented "# Function Name Tests"
    Write-Indented "#   These tests were automatically generated to ensure only the expected"
    Write-Indented "#   functions are exposed from the module. This protects against accidentally"
    Write-Indented "#   removing something and breaking backward compatibility. When new functions"
    Write-Indented "#   are added, this test should be regenerated to reflect the new public API."
    Write-Indented "#=============================================================================="
    Write-Indented ''
    Write-Indented "Describe 'Function names' {"

    Push-Indentation

    Write-Indented "BeforeEach {"
    Push-Indentation
    Write-Indented "Get-Module -Name $($script:ModuleName) -All | Remove-Module -Force -ErrorAction Ignore"
    Write-Indented "Import-Module `$PSScriptRoot\$($script:RelativeModulePath) -Force"
    Pop-Indentation
    Write-Indented "}"

    Write-Indented "Context 'The module exposes only the expected functions' {"

    Push-Indentation

    $commands = Get-Command -Module $ModuleName

    Write-Indented "It 'exposes exactly $($commands.Count) commands' {"

    Push-Indentation
    Write-Indented "(Get-Command -Module $ModuleName).Count | Should -Be $($commands.Count)"
    Pop-Indentation

    Write-Indented "}"

    $commands | ForEach-Object {
        Write-Indented "It 'exposes a function named $($_.Name)' {"
        Push-Indentation

        Write-Indented "Get-Command $($_.Name) -Module $($script:ModuleName) | Should -Not -Be `$null"

        Pop-Indentation
        Write-Indented "}"
    }

    Pop-Indentation

    Write-Indented "}"
    Pop-Indentation

    Write-Indented "}"
}

function Write-ModuleTests {
    Write-Indented "#=============================================================================="
    Write-Indented "# Module Tests"
    Write-Indented "#   These tests were automatically generated to ensure only the expected"
    Write-Indented "#   behavior is exposed from the module. This protects against accidentally"
    Write-Indented "#   removing something and breaking backward compatibility. When new functions"
    Write-Indented "#   are added, this test should be regenerated to reflect the new public API."
    Write-Indented "#=============================================================================="
    Write-Indented ''
    Write-Indented "Describe 'Module behavior' {"

    Push-Indentation

    Write-Indented "BeforeEach {"
    Push-Indentation
    Write-Indented "Get-Module -Name $($script:ModuleName) -All | Remove-Module -Force -ErrorAction Ignore"
    Write-Indented "Import-Module `$PSScriptRoot\$($script:RelativeModulePath) -Force"
    Pop-Indentation
    Write-Indented "}"

    $commands = Get-Command -Module $ModuleName
    Write-Indented "It 'exposes exactly $($commands.Count) functions' {"

    Push-Indentation
    Write-Indented "(Get-Command -Module $($script:ModuleName)).Count | Should -Be $($commands.Count)"
    Pop-Indentation

    Write-Indented "}"

    Pop-Indentation
    Write-Indented "}"
}

function Write-FunctionTests {
    param (
        [System.Management.Automation.FunctionInfo]
        $Function
    )

    Write-Indented "#=============================================================================="
    Write-Indented "# $($_.Name) Compatibility Tests"
    Write-Indented "#   These tests were automatically generated to ensure that this function's"
    Write-Indented "#   public API is never accidentally changed (breaking backward compatibility)."
    Write-Indented "#   When new functionality is added--or if breaking backward compatibility IS"
    Write-Indented "#   intended, then this test should be generated to reflect the new public API."
    Write-Indented "#=============================================================================="
    Write-Indented ''
    Write-Indented "Describe '$($_.Name) compatibility' {"

    Push-Indentation

    Write-Indented "BeforeEach {"
    Push-Indentation
    Write-Indented "Get-Module -Name $($script:ModuleName) -All | Remove-Module -Force -ErrorAction Ignore"
    Write-Indented "Import-Module `$PSScriptRoot\$($script:RelativeModulePath) -Force"
    Pop-Indentation
    Write-Indented "}"

    Write-Indented "It 'exposes a function named $($_.Name)' {"
    Push-Indentation
    Write-Indented "Get-Command $($Function.Name) -Module $($script:ModuleName) | Should -Not -Be `$null"
    Pop-Indentation
    Write-Indented "}"

    $parameterString = if ( $Function.Parameters.Count -eq 1 ) { 'parameter' } else { 'parameters' }

    Write-Indented "It 'exposes exactly $($Function.Parameters.Count) $parameterString' {"
    Push-Indentation
    Write-Indented "(Get-Command $($Function.Name)).Parameters.Count | Should -Be $($Function.Parameters.Count)"
    Pop-Indentation
    Write-Indented "}"

    Pop-Indentation
    Write-Indented "}"
}

Import-Module $Psd1File -Force
Write-ModuleTests | Out-File $OutputPath\Module.Tests.ps1 -Encoding UTF8

Get-Command -Module $script:ModuleName | ForEach-Object {
    Write-FunctionTests $_ | Out-File "$OutputPath\$($_.Name)_Compatibility.Tests.ps1" -Encoding UTF8
}
