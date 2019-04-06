function Set-LocationInternal {
    param (
        $Path
    )

    Microsoft.PowerShell.Management\Set-Location $Path
}

function ConvertTo-FullPath( $Path ) {
    [System.IO.Path]::GetFullPath( $Path )
}

function Set-Location {
    [CmdletBinding()]
    param (
        $Path
    )

    Set-LocationInternal $Path

    $newLocation = ConvertTo-FullPath $Path

    [void] (New-Event -SourceIdentifier Terminoid.LocationChanged -MessageData $newLocation)
    [void] $LocationHistory.Add( $newLocation )
}
