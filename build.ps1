param (
    [switch]
    $ExitOnFailure
)

$oldLocation = $PWD

try {
    Set-Location $PSScriptRoot/src/Module
    & ./build.ps1 -ExitOnFailure:$ExitOnFailure
}
finally {
    Set-Location $oldLocation
}
