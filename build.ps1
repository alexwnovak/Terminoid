powershell -NoProfile -Args $PSScriptRoot -Command {
    param ( $ScriptRoot )

    & $ScriptRoot/build/Install-Dependencies.ps1
    Invoke-psake -buildFile $ScriptRoot/psakefile.ps1

    $exitCode = [int]( -not $psake.build_success )
    Write-Host "Exiting with $exitCode and psake is $psake"
    exit ( [int]( -not $psake.build_success ) )
}
