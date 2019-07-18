using namespace System.Collections.Generic

Set-StrictMode -Version Latest
Get-ChildItem $PSScriptRoot\public, $PSScriptRoot\private -Include *.ps1 -Recurse | ForEach-Object { . $_ }

function InitializeInternalVariables {
    $script:LocationHistory = [List[string]]::new()
    $script:FormatterTable = [Stack[Hashtable]]::new()

    $script:DefaultDetailReader = $function:DefaultFileDetailReader
    $script:DefaultStartHandler = $function:DefaultStartHandler

    $script:PromptHandlers = [List[scriptblock]]::new()
    $script:DefaultPromptFormatter = ${function:Format-Bar}
    Reset-PromptFormatter

    $script:DefaultSpecialCharTable = @{
        AdminIcon = $([char]0xF132)
        BarJoiner = $([char]0xE0B0)
        GitRepoIcon = $([char]0xF113)
        SelectionIndicator = $([char]0x2794)
    }

    $script:SpecialCharTable = $script:DefaultSpecialCharTable.Clone()

    $promptFunction = Get-Item Function:\prompt -ErrorAction SilentlyContinue

    if ( -not $promptFunction ) {
        function global:prompt { }
    }

    $script:DefaultPrompt = (Get-Item Function:\prompt).ScriptBlock

    Reset-DetailReader
    Reset-StartHandler
    Reset-AutoCompletionHandler
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

    if ( IsDebugMode ) {
        Set-PSReadlineKeyHandler -Chord Ctrl+Spacebar -ScriptBlock ${function:Show-AutoCompletion}
    }
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

$ExecutionContext.SessionState.Module.OnRemove = {
    Disable-TerminoidPrompt
}
