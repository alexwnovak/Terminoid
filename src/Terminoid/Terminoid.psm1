function GetLine {
    # [System.Console]::CursorVisible = $false
    [LineInput.Program]::Get()
    # [System.Console]::CursorVisible = $true
}

Write-Host "Initializing..."

[LineInput.RenderManager]::Instance.Initialize()

# Set-Item Function:\PSConsoleHostReadline -Value ${function:GetLine}