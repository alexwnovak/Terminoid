function Format-Date {
    param (
        [Parameter( Mandatory )]
        [DateTime]
        $Date,

        [DateTime]
        $Now = (Get-Date)
    )

    $elapsedTime = New-TimeSpan -Start $Date -End $Now

    if ( $elapsedTime.TotalDays -gt 730 ) {
        "$([int] ($elapsedTime.TotalDays / 365)) years ago"
    } elseif ( $elapsedTime.TotalDays -gt 365 -and $elapsedTime.TotalDays -le 730 ) {
        '1 year ago'
    } elseif ( $elapsedTime.TotalDays -gt 60 -and $elapsedTime.TotalDays -le 365 ) {
        "$([int] ($elapsedTime.TotalDays / 30)) months ago"
    } elseif ( $elapsedTime.TotalDays -gt 31 -and $elapsedTime.TotalDays -le 60 ) {
        '1 month ago'
    } elseif ( $elapsedTime.TotalDays -gt 2 -and $elapsedTime.TotalDays -le 30 ) {
        "$([int] $elapsedTime.TotalDays) days ago"
    } elseif ( $elapsedTime.TotalDays -ge 1 -and $elapsedTime.TotalDays -le 2 ) {
        '1 day ago'
    } elseif ( $elapsedTime.TotalHours -ge 1 -and $elapsedTime.TotalHours -le 2 ) {
        '1 hour ago'
    } elseif ( $elapsedTime.TotalHours -gt 1 ) {
        "$([int] $elapsedTime.TotalHours) hours ago"
    } elseif ( $elapsedTime.TotalMinutes -ge 1 -and $elapsedTime.TotalMinutes -le 2 ) {
        '1 minute ago'
    } elseif ( $elapsedTime.TotalMinutes -gt 1 ) {
        "$([int] $elapsedTime.TotalMinutes) minutes ago"
    } else {
        'just now'
    }
}
