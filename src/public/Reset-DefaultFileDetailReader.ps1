function DefaultFileDetailReader( $Path ) {
    $fileInfo = Get-ChildItem $Path

    @{
        'Last Written' = $fileInfo.LastWriteTime
        'File Size' = '{0:N0} bytes' -f $fileInfo.Length
    }
}

function Reset-DefaultFileDetailReader {
    [CmdletBinding( SupportsShouldProcess )]
    param ()

    if ( $PSCmdlet.ShouldProcess( 'Resetting the default file detail reader' ) ) {
        $script:DefaultDetailReader = $function:DefaultFileDetailReader
    }
}
