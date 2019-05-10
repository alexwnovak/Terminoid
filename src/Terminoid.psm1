Set-StrictMode -Version Latest
Get-ChildItem $PSScriptRoot\*.ps1 -Recurse | ForEach-Object { . $_ }

function InitializeInternalVariables {
    [System.Collections.ArrayList] $script:BarSegments = New-Object -TypeName System.Collections.ArrayList
    [System.Collections.ArrayList] $script:LocationHistory = @()
    $script:FormatterTable = New-Object System.Collections.Stack

    $script:DefaultDetailReader = $function:DefaultFileDetailReader
    $script:DefaultStartHandler = $function:DefaultStartHandler

    $script:SpecialCharTable = @{
        BarJoiner = [char]0xE0B0
    }

    [System.Collections.ArrayList] $script:DetailReaderTable = @()
    Reset-DetailReader

    Reset-StartHandler
}

function ExportPublicFunctions {
    Get-ChildItem $PSScriptRoot\public\*.ps1 -Recurse | ForEach-Object {
        Export-ModuleMember -Function $_.BaseName
    }
}

function RegisterKeyHandlers {
    Set-PSReadLineKeyHandler -Chord Ctrl+O -ScriptBlock ${function:Add-StartItemCommand} -BriefDescription 'TerminoidInsertStartItem' -Description 'Inserts a Start-Item command'
    Set-PSReadLineKeyHandler -Chord Ctrl+N -ScriptBlock ${function:Add-NewItemCommand} -BriefDescription 'TerminoidInsertNewItem' -Description 'Inserts a New-Item command'
    Set-PSReadLineKeyHandler -Chord Ctrl+Shift+N -ScriptBlock ${function:Add-NewDirectoryCommand} -BriefDescription 'TerminoidInsertNewDirectory' -Description 'Inserts a New-Item command for directories'
}

InitializeInternalVariables
ExportPublicFunctions
RegisterKeyHandlers
