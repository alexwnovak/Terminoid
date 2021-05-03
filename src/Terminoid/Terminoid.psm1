function GetLine {
    [Terminoid.LineInput]::ReadLine()
}

Write-Host "Initializing..."

[Terminoid.RenderManager]::Instance.Initialize()

# $ExecutionContext.SessionState.Module.OnRemove = {
#     [LineInput.RenderManager]::Instance.ShutDown()
# }

Set-Item Function:\PSConsoleHostReadline -Value ${function:GetLine}