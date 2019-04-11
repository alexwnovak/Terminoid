function Reset-GlobalState {
    $BarSegments.Clear()
    Clear-LocationHistory
    Clear-FormatterTable
}

function Resolve-TestFile( $Name ) {
    "$PSScriptRoot\TestFiles\$Name"
}

$modulePath = Convert-Path $PSScriptRoot\..\src
$moduleManifestPath = "$modulePath\Terminoid.psd1"

Get-Module -Name Terminoid -All | Remove-Module -Force -ErrorAction Ignore
Import-Module $moduleManifestPath -Force
