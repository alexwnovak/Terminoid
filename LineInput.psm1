function GetLine {
    [LineInput.Program]::Get()
}

Set-Item Function:\PSConsoleHostReadline -Value ${function:GetLine}