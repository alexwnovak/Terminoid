using System;
using System.Management.Automation;

namespace Terminoid.Cmdlets
{
    [Cmdlet(VerbsCommon.Format, "Date")]
    [OutputType(typeof(string))]
    public class FormatDateCmdlet : PSCmdlet
    {
        [Parameter(
            Mandatory = true
        )]
        public DateTime Date { get; set; }

        protected override void ProcessRecord()
        {
            WriteObject("just now");
        }
    }
}