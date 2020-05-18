using System.Text;

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
                sb.Append($"\x1B[49m");
            }
            else
            {
                sb.Append($"\x1B[48;2;{Color.R};{Color.G};{Color.B}m");
            }

            EvaluateChildren(sb);
        }
    }
}