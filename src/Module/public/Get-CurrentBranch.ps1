function Get-CurrentBranch {
    git rev-parse --abbrev-ref HEAD
}
