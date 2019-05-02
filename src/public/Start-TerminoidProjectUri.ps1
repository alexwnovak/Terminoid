function Start-TerminoidProjectUri {
    [CmdletBinding()]
    param ()

    Start-Process $MyInvocation.MyCommand.Module.PrivateData.PSData.ProjectUri
}
