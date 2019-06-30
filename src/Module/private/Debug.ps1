$script:Debug = $false

function EnableDebugMode {
    $script:Debug = $true
}

function IsDebugMode {
    $script:Debug
}
