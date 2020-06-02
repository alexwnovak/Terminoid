using System;
using System.Management.Automation;

namespace Terminoid.Cmdlets
{
    [Cmdlet(VerbsCommon.Select, "FromMany")]
    public class SelectFromManyCmdlet : PSCmdlet
    {
        private int _selectedIndex = 0;

        [Parameter(
            Mandatory = true
        )]
        public object[] Choices { get; set; }

        protected override void ProcessRecord()
        {
            RenderChoices();
        }

        private void RenderChoices()
        {
            for (int index = 0; index < Choices.Length; index++)
            {
                if (index == _selectedIndex)
                {
                    Console.WriteLine($"* {Choices[index]}");
                }
                else
                {
                    Console.WriteLine($"  {Choices[index]}");
                }
            }
        }
    }
}