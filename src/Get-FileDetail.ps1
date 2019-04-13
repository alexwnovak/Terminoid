function DefaultFileStatReader( $Path ) {
    $fileInfo = Get-ChildItem $Path

    @{
        'Last Written' = $fileInfo.LastWriteTime
        'File Size' = '{0:N0} bytes' -f $fileInfo.Length
    }
}

function Get-FileDetail {
    param (
        [string]
        $Path
    )

    & $DefaultStatReader $Path

    foreach ( $statReader in $StatReaderTable ) {
        $extension = [System.IO.Path]::GetExtension( $Path )

        if ( $extension -eq $statReader.Extension ) {
            & $statReader.Function $Path
        }
    }
}
