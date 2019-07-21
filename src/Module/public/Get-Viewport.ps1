function Get-Viewport {
    @{
        Width = $Host.UI.RawUI.WindowSize.Width
        Height = $Host.UI.RawUI.WindowSize.Height
        BufferWidth = $Host.UI.RawUI.BufferSize.Width
        BufferHeight = $Host.UI.RawUI.BufferSize.Height
    }
}
