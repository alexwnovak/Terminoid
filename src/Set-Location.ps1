function Set-LocationInternal {
    Set-Location @Args
}

function Set-Location {
    param (
        $Path
    )

    Set-LocationInternal @Args

    [void] $LocationHistory.Add( $Path )
}
