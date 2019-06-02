$GitCommands = @(
    'add',
    'checkout'
)

$CommandTable = [List[Hashtable]]::new()
$CommandTable.Add( @{
    MatchText = 'git add *'
    Provider = { @(GetModifiedFiles) + @(GetUntrackedFiles) }
} )
$CommandTable.Add( @{
    MatchText = 'git checkout *'
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

function GitCommandCompleter( $Command ) {
    foreach ( $tableEntry in $CommandTable ) {
        if ( $Command -like $tableEntry.MatchText ) {
            $results = & $tableEntry.Provider
            $tokens = -split $Command

            if ( $tokens.Count -ge 3 ) {
                $partialSearch = $tokens[2]
                $results = $results | Where-Object { $_.StartsWith( $partialSearch, [StringComparison]::InvariantCultureIgnoreCase ) }
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
            $results = $results | Where-Object { $_.StartsWith( $partialSearch, [StringComparison]::InvariantCultureIgnoreCase ) }
        }

        WriteCompletionResults $results
    }
}
