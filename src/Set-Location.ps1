function Set-LocationInternal {
    param (
        $Path
    )

    Microsoft.PowerShell.Management\Set-Location $Path
}

function Set-Location {
    [CmdletBinding()]
    param (
        $Path
    )

    Set-LocationInternal $Path

    [void] $LocationHistory.Add( $Path )
}
