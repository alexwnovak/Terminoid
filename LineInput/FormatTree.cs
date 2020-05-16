using System.Text;

namespace LineInput
{
    internal class FormatTree
    {
        private readonly TextBuffer _textBuffer;
        private readonly FormatTreeNode _headNode = new TextNode(string.Empty);

        public FormatTree(TextBuffer textBuffer)
        {
            _textBuffer = textBuffer;
            BuildTree();
        }

        private void BuildTree()
        {
            // Algorithm to scan TextBuffer into a tree goes here
            _headNode.Children.Add(new TextNode(_textBuffer.ToFullString()));
        }

        public string Evaluate()
        {
            var stringBuilder = new StringBuilder();

            _headNode.Evaluate(stringBuilder);

            return stringBuilder.ToString();
        }
    }
}