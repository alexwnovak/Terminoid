using System.Text;

namespace Terminoid
{
    internal class TextNode : FormatTreeNode
    {
        public string Text { get; }

        public TextNode(string text) => Text = text;

        public override void Evaluate(StringBuilder sb)
        {
            sb.Append(Text);
            EvaluateChildren(sb);
        }
    }
}