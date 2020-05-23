& ./build.ps1
pwsh -NoExit -Command "& {Import-Module ./output/Terminoid.psd1;Write-Host 'Loaded Terminoid module' -Foreground Green}"