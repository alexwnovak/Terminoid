Task RunTests {
    Invoke-Pester $PSScriptRoot/tests
}

Task default -depends RunTests
