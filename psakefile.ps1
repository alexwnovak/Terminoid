Properties {
    $PSBPreference.Test.CodeCoverage.Enabled = $true
    $PSBPreference.Test.CodeCoverage.Threshold = 1
}

Task Test -FromModule PowerShellBuild -Version '0.3.0'
Task default -depends Test
