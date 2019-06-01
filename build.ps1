param (
    [switch]
    $ExitOnFailure
)

if ( $ExitOnFailure ) {
    Set-Location $PSScriptRoot/src/Module
    & build/Install-Dependencies.ps1
    Invoke-psake
    exit ( [int]( -not $psake.build_success ) )
} else {
    powershell -NoProfile -Args $PSScriptRoot -Command {
        param ( $ScriptRoot )
        Set-Location $ScriptRoot/src/Module
        & build/Install-Dependencies.ps1
        Invoke-psake
    }
}
