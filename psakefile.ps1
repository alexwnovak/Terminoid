Properties {
    $PSBPreference.Test.CodeCoverage.Enabled = $true
    $PSBPreference.Test.CodeCoverage.Threshold = 1
    $PSBPreference.Test.ScriptAnalysis.FailBuildOnSeverityLevel = 'Warning'
}

Task Test -FromModule PowerShellBuild -Version '0.3.0'
Task default -depends Test
