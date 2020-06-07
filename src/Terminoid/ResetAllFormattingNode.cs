using System.Text;

namespace Terminoid
{
    internal class ResetAllFormattingNode : FormatTreeNode
    {
        public override void Evaluate(StringBuilder sb)
        {
            sb.Append(VT.ResetAll());
        }
    }
}