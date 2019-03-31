function Reset-GlobalState {
    $BarSegments.Clear()
    $LocationHistory.Clear()
    $FormatterTable.Clear()
}

$modulePath = Convert-Path $PSScriptRoot\..\src
$moduleManifestPath = "$modulePath\Terminoid.psd1"

Import-Module $moduleManifestPath -Force
