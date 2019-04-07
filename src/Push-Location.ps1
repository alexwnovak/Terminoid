function Push-Location {
    param (
        $Path
    )

    Microsoft.PowerShell.Management\Push-Location $Path

    $newLocation = Convert-Path $Path

    [void] (New-Event -SourceIdentifier Terminoid.LocationChanged -MessageData $newLocation)
    [void] $LocationHistory.Add( $newLocation )
}
