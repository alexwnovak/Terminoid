using System.Text;

namespace Terminoid
{
    internal class ResetForegroundNode : FormatTreeNode
    {
        public override void Evaluate(StringBuilder sb)
        {
            sb.Append(VT.ResetForeground());
        }
    }
}