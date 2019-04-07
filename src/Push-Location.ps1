function Push-LocationInternal {
    param (
        $Path
    )

    Microsoft.PowerShell.Management\Push-Location $Path
}

function Push-Location {
    param (
        $Path
    )

    Push-LocationInternal $Path
}
