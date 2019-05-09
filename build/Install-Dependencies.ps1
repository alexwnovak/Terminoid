function Get-Dependencies {
    Get-Content $PSScriptRoot\Dependencies.json | ConvertFrom-Json
}

function Test-Module( $Name, $Version ) {
    if ( Get-InstalledModule $dependency.name -RequiredVersion $dependency.version -AllowPrerelease -ErrorAction SilentlyContinue ) {
        return $true
    }

    if ( (Get-Module $dependency.name -ListAvailable).Version -eq $Version ) {
        return $true
    }

    $false
}

function Install-Dependencies {
    param (
        $Dependencies
    )

    foreach ( $dependency in $Dependencies ) {
        Write-Host "Detecting dependency: $($dependency.name)... " -NoNewline

        if ( Test-Module -Name $dependency.name -Version $dependency.version ) {
            Write-Host 'found!' -ForegroundColor Green
        } else {
            Write-Host 'not found!' -ForegroundColor Red
            Write-Host "  Installing $($dependency.name) v$($dependency.version)... " -NoNewline

            Install-Module -Name $dependency.name -RequiredVersion $dependency.version -AllowPrerelease
            Write-Host 'done!' -ForegroundColor Green
        }
    }
}

Install-Dependencies (Get-Dependencies).ModuleDependencies
