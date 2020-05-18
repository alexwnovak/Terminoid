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
                sb.Append($"\x1B[39m");
            }
            else
            {
                sb.Append($"\x1B[38;2;{Color.R};{Color.G};{Color.B}m");
            }

            EvaluateChildren(sb);
        }
    }
}