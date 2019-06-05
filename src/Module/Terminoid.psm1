using namespace System.Collections.Generic

Set-StrictMode -Version Latest
Get-ChildItem $PSScriptRoot\public, $PSScriptRoot\private -Include *.ps1 -Recurse | ForEach-Object { . $_ }

function InitializeInternalVariables {
    $script:BarSegments = [List[Hashtable]]::new()
    $script:LocationHistory = [List[string]]::new()
    $script:FormatterTable = [Stack[Hashtable]]::new()

    $script:DefaultDetailReader = $function:DefaultFileDetailReader
    $script:DefaultStartHandler = $function:DefaultStartHandler

    $script:DefaultSpecialCharTable = @{
        BarJoiner = $([char]0xE0B0)
    }

    $script:SpecialCharTable = @{
        BarJoiner = $script:DefaultSpecialCharTable['BarJoiner']
    }

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

Register-ArgumentCompleter -Native -CommandName git -ScriptBlock {
    param (
        $WordToComplete,
        $CommandAst,
        $CursorPosition
    )

    $command = $CommandAst.ToString()

    if ( !$WordToComplete ) {
        $command += ' '
    }

    GitCommandCompleter -Command $command
}

Register-ArgumentCompleter -Native -CommandName git -ScriptBlock ${function:GitArgumentCompleter}

InitializeInternalVariables
ExportPublicFunctions
RegisterKeyHandlers