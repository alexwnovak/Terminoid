$GitCommands = @(
    'add',
    'checkout'
)

$CommandTable = [List[Hashtable]]::new()
$CommandTable.Add( @{
    MatchText = 'git add'
    Provider = { @(GetModifiedFiles) + @(GetUntrackedFiles) }
} )
$CommandTable.Add( @{
    MatchText = 'git branch -d'
    Provider = { GetGitBranches }
} )
$CommandTable.Add( @{
    MatchText = 'git checkout'
    Provider = { GetGitBranches }
} )

function WriteCompletionResults( $Results ) {
    $Results.ForEach( {
        [System.Management.Automation.CompletionResult]::new( $_, $_, 'ParameterValue', $_ )
    } )
}

function GitArgumentCompleter {
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

function IsMatch( $Text, $PartialSearch ) {
    if ( $PartialSearch -notcontains '*' ) {
        $PartialSearch += '*'
    }

    $Text -like $PartialSearch
}

function GitCommandCompleter( $Command ) {
    foreach ( $tableEntry in $CommandTable ) {
        $commandMatch = $tableEntry.MatchText + ' *'

        if ( $Command -like $commandMatch ) {
            $results = & $tableEntry.Provider
            $tokens = -split $Command
            $matchTextTokens = -split $tableEntry.MatchText

            if ( $tokens.Count -gt $matchTextTokens.Count ) {
                $partialSearch = $tokens[-1]
                $results = $results | Where-Object { IsMatch $_ $partialSearch }
            }

            WriteCompletionResults $results
            return
        }
    }

    if ( $Command -like 'git *' ) {
        $tokens = -split $Command
        $results = $GitCommands

        if ( $tokens.Count -ge 2 ) {
            $partialSearch = $tokens[1]
            $results = $results | Where-Object { IsMatch $_ $partialSearch }
        }

        WriteCompletionResults $results
    }
}
