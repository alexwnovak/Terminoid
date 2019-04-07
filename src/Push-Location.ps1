function Push-Location {
    param (
        $Path
    )

    $newLocation = Convert-Path $Path

    Microsoft.PowerShell.Management\Push-Location $Path

    [void] (New-Event -SourceIdentifier Terminoid.LocationChanged -MessageData $newLocation)
    [void] $LocationHistory.Add( $newLocation )
}
