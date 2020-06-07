using System.Text;

namespace Terminoid
{
    internal class ResetBackgroundNode : FormatTreeNode
    {
        public override void Evaluate(StringBuilder sb)
        {
           sb.Append(VT.ResetBackground());
        }
    }
}