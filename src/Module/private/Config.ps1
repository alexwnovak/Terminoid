function EnsureConfigExists {
    $path = Join-Path $HOME '.terminoid'
    $null = New-Item $path -ItemType Directory -Force
}