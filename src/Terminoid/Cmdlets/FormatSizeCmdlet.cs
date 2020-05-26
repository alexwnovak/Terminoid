using System.Management.Automation;

namespace Terminoid.Cmdlets
{
    [Cmdlet(VerbsCommon.Format, "Size")]
    public class FormatSizeCmdlet : PSCmdlet
    {
        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromPipeline = true
        )]
        public long Size { get; set; }

        protected override void ProcessRecord()
        {
            WriteObject($"{Size} B");
        }
    }
}