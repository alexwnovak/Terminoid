$GitCommands = @(
    'add',
    'checkout'
)

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
    if ( $Command -like 'git add *' ) {
        $tokens = -split $Command

        $modifiedFiles = @(GetModifiedFiles)
        $untrackedFiles = @(GetUntrackedFiles)

        $allFiles = $modifiedFiles + $untrackedFiles

        if ( $tokens.Count -ge 3 ) {
            $partialSearch = $tokens[2]
            $allFiles = $allFiles | Where-Object { $_.StartsWith( $partialSearch, [StringComparison]::InvariantCultureIgnoreCase ) }
        }

        $allFiles.ForEach( {
            WriteCompletionResult $_
        } )
    } elseif ( $Command -like 'git checkout *' ) {
        $tokens = -split $Command
        $branches = GetGitBranches

        if ( $tokens.Count -ge 3 ) {
            $partialSearch = $tokens[2]
            $branches = $branches | Where-Object { $_.StartsWith( $partialSearch, [StringComparison]::InvariantCultureIgnoreCase ) }
        }

        $branches.ForEach( {
            WriteCompletionResult $_
        } )
    } elseif ( $Command -like 'git *' ) {
        $tokens = -split $Command
        $commands = $GitCommands

        if ( $tokens.Count -ge 2 ) {
            $partialSearch = $tokens[1]
            $commands = $commands | Where-Object { $_.StartsWith( $partialSearch, [StringComparison]::InvariantCultureIgnoreCase ) }
        }

        $commands.ForEach( {
            WriteCompletionResult $_
        } )
    }
}
