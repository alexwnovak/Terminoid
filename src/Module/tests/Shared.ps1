Set-StrictMode -Version Latest

function Reset-GlobalState {
    Clear-LocationHistory
    Clear-FormatterTable
}

function Resolve-TestFile( $Name ) {
    "$PSScriptRoot\TestFiles\$Name"
}

$modulePath = Convert-Path $PSScriptRoot\..
$moduleManifestPath = "$modulePath\Terminoid.psd1"

Get-Module -Name Terminoid -All | Remove-Module -Force -ErrorAction Ignore
Import-Module $moduleManifestPath -Force
