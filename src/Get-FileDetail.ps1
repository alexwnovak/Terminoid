function DefaultFileDetailReader( $Path ) {
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

    & $DefaultDetailReader $Path

    foreach ( $detailReader in $DetailReaderTable ) {
        $extension = [System.IO.Path]::GetExtension( $Path )

        if ( $extension -eq $detailReader.Extension ) {
            & $detailReader.Function $Path
        }
    }
}
