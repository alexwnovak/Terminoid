using System;
using System.Management.Automation;

namespace Terminoid.Cmdlets
{
    [Cmdlet(VerbsCommon.Format, "Bytes")]
    public class FormatBytesCmdlet : PSCmdlet
    {
        private static readonly long[] _sizeTable = new[]
        {
            1L << 50,
            1L << 40,
            1L << 30,
            1L << 20,
            1L << 10,
        };

        private static readonly string[] _labelTable = new[]
        {
            "PB", "TB", "GB", "MB", "KB"
        };

        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromPipeline = true
        )]
        public long Size { get; set; }

        [Parameter]
        public int Places { get; set; } = 1;

        protected override void ProcessRecord()
        {
            for (int index = 0; index < _sizeTable.Length; index++)
            {
                if (Size > _sizeTable[index])
                {
                    double unitSize = (double)Size / _sizeTable[index];
                    unitSize = Math.Round(unitSize, Places);

                    WriteObject($"{unitSize} {_labelTable[index]}");
                    return;
                }
            }

            WriteObject($"{Size} B");
        }
    }
}