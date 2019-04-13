function Get-ImageDetail( $Path ) {
    Add-Type -AssemblyName System.Drawing

    $image = New-Object System.Drawing.Bitmap $Path

    try {
        @{
            Width = $image.Width;
            Height = $image.Height
        }
    }
    finally {
        $image.Dispose()
    }
}
