function GetGitBranches {
    git for-each-ref --format='%(refname:short)' refs/heads/
}

function GetUntrackedFiles {
    git ls-files --others --exclude-standard
}

function GetModifiedFiles {
    git ls-files --modified --exclude-standard
}

function GetStagedFiles {
    git diff --name-only --cached
}
