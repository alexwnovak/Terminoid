function Add-NewDirectoryCommand {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert( 'New-Item -ItemType Directory ' )
}
