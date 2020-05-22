using System.Text;

namespace LineInput
{
    internal class ForegroundColorNode : FormatTreeNode
    {
        public Color Color { get; }

        public ForegroundColorNode(Color color) => Color = color;

        public override void Evaluate(StringBuilder sb)
        {
            if (Color.IsEmpty)
            {
                sb.Append(VT.ResetForeground());
            }
            else
            {
                sb.Append(VT.SetForegroundRgb(Color));
            }

            EvaluateChildren(sb);
        }
    }
}