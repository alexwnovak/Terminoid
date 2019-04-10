Properties {
    $PSBPreference.Test.ScriptAnalysisEnabled = $false
    $PSBPreference.Test.CodeCoverage.Enabled = $true
}

Task Test -FromModule PowerShellBuild -Version '0.3.0'
Task default -depends Test
