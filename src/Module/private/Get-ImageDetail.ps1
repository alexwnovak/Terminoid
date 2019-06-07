function Get-ImageDetail( $Path ) {
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
