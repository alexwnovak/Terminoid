function DefaultFileDetailReader( $Path ) {
    $item = Get-Item $Path

    if ( $item -is [System.IO.DirectoryInfo] ) {
        @{
            'Last Written' = $item.LastWriteTime
        }
    } else {
        @{
            'Last Written' = $item.LastWriteTime
            'File Size' = '{0:N0} bytes' -f $item.Length
        }
    }
}

function Reset-DefaultFileDetailReader {
    [CmdletBinding( SupportsShouldProcess )]
    param ()

    if ( $PSCmdlet.ShouldProcess( 'Resetting the default file detail reader' ) ) {
        $script:DefaultDetailReader = $function:DefaultFileDetailReader
    }
}
