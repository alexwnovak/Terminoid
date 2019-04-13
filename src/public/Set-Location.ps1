function Set-Location {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute( 'PSUseShouldProcessForStateChangingFunctions', '' )]
    param (
        $Path
    )

    $newLocation = Convert-Path $Path

    Microsoft.PowerShell.Management\Set-Location $Path

    [void] (New-Event -SourceIdentifier Terminoid.LocationChanged -MessageData $newLocation)
    [void] $LocationHistory.Add( $newLocation )
}
