function Get-FileDetail {
    param (
        [string]
        $Path
    )

    [hashtable] $details = @{}
    $details += & $DefaultDetailReader $Path

    foreach ( $detailReader in $DetailReaderTable ) {
        $extension = [System.IO.Path]::GetExtension( $Path )

        if ( $extension -eq $detailReader.Extension ) {
            $details += & $detailReader.Function $Path
        }
    }

    $details
}
