function Test-GitRepoPath {
    param (
        $Path = (Resolve-Path '.')
    )

    if ( !$Path ) {
        return $false
    }

    if ( Test-Path "$Path\.git" ) {
        return $true
    }

    Test-GitRepoPath (Split-Path $Path)
}
