function GetLine {
    # [System.Console]::CursorVisible = $false
    [LineInput.Program]::Get()
    # [System.Console]::CursorVisible = $true
}

Set-Item Function:\PSConsoleHostReadline -Value ${function:GetLine}