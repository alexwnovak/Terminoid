powershell -NoProfile -Command {
    & ./build/Install-Dependencies.ps1
    Invoke-psake
}
