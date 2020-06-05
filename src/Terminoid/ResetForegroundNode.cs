using System.Text;
using Terminoid;

namespace LineInput
{
    internal class ResetForegroundNode : FormatTreeNode
    {
        public override void Evaluate(StringBuilder sb)
        {
            sb.Append(VT.ResetForeground());
        }
    }
}