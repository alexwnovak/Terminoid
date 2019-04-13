Get-ChildItem $PSScriptRoot\*.ps1 -Recurse | ForEach-Object { . $_ }

[System.Collections.ArrayList] $script:BarSegments = @()
[System.Collections.ArrayList] $script:LocationHistory = @()
$script:FormatterTable = New-Object System.Collections.Stack

$script:DefaultDetailReader = $function:DefaultFileDetailReader

$script:SpecialCharTable = @{
    Joiner = [char]0xE0B0
}

[System.Collections.ArrayList] $script:DetailReaderTable = @()
Reset-DetailReader

New-Alias -Name stat -Value Get-FileDetail

Get-ChildItem $PSScriptRoot\public\*.ps1 -Recurse | ForEach-Object {
    Export-ModuleMember -Function $_.BaseName
}

Export-ModuleMember -Alias stat
