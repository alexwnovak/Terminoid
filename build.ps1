$oldLocation = $PWD

try {
    Set-Location $PSScriptRoot/src/Module
    & ./build.ps1
}
finally {
    Set-Location $oldLocation
}
