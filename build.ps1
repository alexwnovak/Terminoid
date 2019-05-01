powershell -NoProfile -Args $PSScriptRoot -Command {
    param ( $ScriptRoot )

    & $ScriptRoot/build/Install-Dependencies.ps1
    Invoke-psake -buildFile $ScriptRoot/psakefile.ps1

    exit ( [int]( -not $psake.build_success ) )
}
