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
            var elapsedTime = DateTime.Now - Date;

            if (elapsedTime.TotalMinutes >= 1 && elapsedTime.TotalMinutes <= 2)
            {
                WriteObject("1 minute ago");
            }
            else if (elapsedTime.TotalMinutes > 2)
            {
                WriteObject($"{(int)elapsedTime.TotalMinutes} minutes ago");
            }
            else
            {
                WriteObject("just now");
            }
        }
    }
}