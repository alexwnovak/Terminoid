param (
    [switch]
    $ExitOnFailure
)

if ( $ExitOnFailure ) {
    & $PSScriptRoot/build/Install-Dependencies.ps1
    Invoke-psake
    exit ( [int]( -not $psake.build_success ) )
} else {
    powershell -NoProfile -Args $PSScriptRoot -Command {
        param ( $ScriptRoot )
        & $ScriptRoot/build/Install-Dependencies.ps1
        Invoke-psake
    }
}
