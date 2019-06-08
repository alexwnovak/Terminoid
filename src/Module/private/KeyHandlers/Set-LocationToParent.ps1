function Set-LocationToParent {
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert( 'Set-Location ..' )
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
