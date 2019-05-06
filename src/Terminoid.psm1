Set-StrictMode -Version Latest

Get-ChildItem $PSScriptRoot\*.ps1 -Recurse | ForEach-Object { . $_ }

function InitializeInternalVariables {
    [System.Collections.ArrayList] $script:BarSegments = New-Object -TypeName System.Collections.ArrayList
    [System.Collections.ArrayList] $script:LocationHistory = @()
    $script:FormatterTable = New-Object System.Collections.Stack

    $script:DefaultDetailReader = $function:DefaultFileDetailReader
    $script:DefaultStartHandler = $function:DefaultStartHandler

    $script:SpecialCharTable = @{
        Joiner = [char]0xE0B0
    }

    [System.Collections.ArrayList] $script:DetailReaderTable = @()
    Reset-DetailReader
}

function ExportPublicFunctions {
    Get-ChildItem $PSScriptRoot\public\*.ps1 -Recurse | ForEach-Object {
        Export-ModuleMember -Function $_.BaseName
    }
}

InitializeInternalVariables
ExportPublicFunctions
