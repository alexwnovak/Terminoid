function WriteCompletionResult( $Result ) {
    [System.Management.Automation.CompletionResult]::new( $Result, $Result, 'ParameterValue', $Result )
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
    if ( $Command -like 'git checkout *' ) {
        $tokens = -split $Command
        $branches = GetGitBranches

        if ( $tokens.Count -ge 3 ) {
            $partialSearch = $tokens[2]
            $branches = $branches | Where-Object { $_.StartsWith( $partialSearch, [StringComparison]::InvariantCultureIgnoreCase ) }
        }

        $branches | ForEach-Object {
            WriteCompletionResult $_
        }
    }
}
