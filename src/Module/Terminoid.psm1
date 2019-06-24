using namespace System.Collections.Generic

Set-StrictMode -Version Latest
Get-ChildItem $PSScriptRoot\public, $PSScriptRoot\private -Include *.ps1 -Recurse | ForEach-Object { . $_ }

function InitializeInternalVariables {
    $script:BarSegments = [List[Hashtable]]::new()
    $script:LocationHistory = [List[string]]::new()
    $script:FormatterTable = [Stack[Hashtable]]::new()

    $script:DefaultDetailReader = $function:DefaultFileDetailReader
    $script:DefaultStartHandler = $function:DefaultStartHandler

    $script:PromptHandlers = [List[scriptblock]]::new()
    $script:PromptFormatter = $function:DefaultPromptFormatter

    $script:DefaultSpecialCharTable = @{
        BarJoiner = $([char]0xE0B0)
        SelectionIndicator = $([char]0x2794)
    }

    $script:SpecialCharTable = $script:DefaultSpecialCharTable.Clone()

    $script:DefaultPrompt = (Get-Item Function:\prompt).ScriptBlock

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
    Set-PSReadLineKeyHandler -Chord Ctrl+Shift+UpArrow -ScriptBlock ${function:Set-LocationToParent} -BriefDescription 'TerminoidNavigateUp' -Description 'Navigates up one directory'
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
