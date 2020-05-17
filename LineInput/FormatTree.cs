using System.Text;

namespace LineInput
{
    internal class FormatTree
    {
        private class FormatState
        {
            public Color Foreground { get; set; } = Color.Empty();
            public Color Background { get; set; } = Color.Empty();
        }

        private readonly TextBuffer _textBuffer;
        private readonly FormatTreeNode _headNode = new TextNode(string.Empty);

        public FormatTree(TextBuffer textBuffer)
        {
            _textBuffer = textBuffer;
            BuildTree();
        }

        private void BuildTree()
        {
            var run = new StringBuilder();
            var formatState = new FormatState();

            foreach (var cell in _textBuffer)
            {
                run.Append(cell.Char);

                if (formatState.Background != cell.Background)
                {
                    _headNode.Children.Add(new BackgroundColorNode(cell.Background));
                    _headNode.Children.Add(new TextNode(run.ToString()));
                    run.Clear();
                }
            }

            _headNode.Children.Add(new TextNode(run.ToString()));
        }

        public string Evaluate()
        {
            var stringBuilder = new StringBuilder();

            _headNode.Evaluate(stringBuilder);

            return stringBuilder.ToString();
        }
    }
}