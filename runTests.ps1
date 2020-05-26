& ./build.ps1
pwsh -Command "& {Import-Module ./output/Terminoid.psd1;Invoke-Gherkin}"