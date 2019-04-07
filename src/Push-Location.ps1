function Push-LocationInternal {
    param (
        $Path
    )

    Microsoft.PowerShell.Management\Push-Location $Path
}

function ConvertTo-FullPath( $Path ) {
    [System.IO.Path]::GetFullPath( $Path )
}

function Push-Location {
    param (
        $Path
    )

    Push-LocationInternal $Path

    $newLocation = ConvertTo-FullPath $Path

    [void] (New-Event -SourceIdentifier Terminoid.LocationChanged -MessageData $newLocation)
}
