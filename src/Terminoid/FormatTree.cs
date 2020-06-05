using System;
using System.Text;
using Terminoid;

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
                // Detect whether there is any difference

                bool foregroundChanged = formatState.Foreground != cell.Foreground;
                bool backgroundChanged = formatState.Background != cell.Background;
                bool hasDifference = foregroundChanged || backgroundChanged;

                if (hasDifference)
                {
                    // Now that the nodes for format change have been emitted, we need to write
                    // out a text node to conclude everything
                    _headNode.Children.Add(new TextNode(run.ToString()));
                    run.Clear();

                    // We know something has changed, so we'll emit nodes that transition the
                    // new state into what has changed--this may be multiple nodes

                    if (foregroundChanged)
                    {
                        _headNode.Children.Add(new ForegroundColorNode(cell.Foreground));
                        formatState.Foreground = cell.Foreground;
                    }

                    if (backgroundChanged)
                    {
                        _headNode.Children.Add(new BackgroundColorNode(cell.Background));
                        formatState.Background = cell.Background;
                    }
                }

                run.Append(cell.Char);
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