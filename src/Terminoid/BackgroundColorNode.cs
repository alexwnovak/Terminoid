using System.Text;
using Terminoid;

namespace LineInput
{
    internal class BackgroundColorNode : FormatTreeNode
    {
        public Color Color { get; }

        public BackgroundColorNode(Color color) => Color = color;

        public override void Evaluate(StringBuilder sb)
        {
            if (Color.IsEmpty)
            {
                sb.Append(VT.ResetBackground());
            }
            else
            {
                sb.Append(VT.SetBackgroundRgb(Color));
            }

            EvaluateChildren(sb);
        }
    }
}