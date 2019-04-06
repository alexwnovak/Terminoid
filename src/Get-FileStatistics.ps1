function DefaultFileStatReader( $Path ) {
    $fileInfo = Get-ChildItem $Path

    @{
        'Last Written' = $fileInfo.LastWriteTime
        'File Size' = '{0:N0} bytes' -f $fileInfo.Length
    }
}

function Get-FileStatistics {
    param (
        [string]
        $Path
    )

    & $DefaultStatReader $Path
}