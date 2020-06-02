using System;
using System.Management.Automation;

namespace Terminoid.Cmdlets
{
    [Cmdlet(VerbsCommon.Select, "FromMany")]
    public class SelectFromManyCmdlet : PSCmdlet
    {
        protected override void ProcessRecord()
        {
            Console.WriteLine("Select");
        }
    }
}