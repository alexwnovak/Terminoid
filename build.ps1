Remove-Item output/*
dotnet build ./src/Terminoid -o ./output
Copy-Item ./src/Terminoid/Terminoid.ps?1 ./output -force