using System.Management.Automation;

namespace Terminoid.Cmdlets
{
    [Cmdlet(VerbsCommon.Format, "Date")]
    public class FormatDateCmdlet : PSCmdlet
    {
        protected override void ProcessRecord()
        {
            WriteObject("Done");
        }
    }
}