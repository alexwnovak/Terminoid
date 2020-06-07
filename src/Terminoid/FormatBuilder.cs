using System;
using System.Collections.Generic;
using System.Text;

namespace Terminoid
{
    public class FormatBuilder
    {
        private readonly List<FormatTreeNode> _formatList = new List<FormatTreeNode>();
        private readonly Stack<FormatTreeNode> _foregroundRevertStack = new Stack<FormatTreeNode>();
        private readonly Stack<FormatTreeNode> _backgroundRevertStack = new Stack<FormatTreeNode>();

        public void PushForeground(ConsoleColor color)
        {
            _formatList.Add(new ForegroundColorNode(color));
            _foregroundRevertStack.Push(new ResetForegroundNode());
        }

        public void PushForeground(Color color)
        {
            _formatList.Add(new ForegroundColorNode(color));
            _foregroundRevertStack.Push(new ResetForegroundNode());
        }

        public void PushBackground(ConsoleColor color)
        {
            _formatList.Add(new BackgroundColorNode(color));
            _backgroundRevertStack.Push(new ResetBackgroundNode());
        }

        public void PushBackground(Color color)
        {
            _formatList.Add(new BackgroundColorNode(color));
            _backgroundRevertStack.Push(new ResetBackgroundNode());
        }

        public void PopForeground()
        {
            if (_foregroundRevertStack.Count > 0)
            {
                _formatList.Add(_foregroundRevertStack.Pop());
            }
        }

        public void PopBackground()
        {
            if (_backgroundRevertStack.Count > 0)
            {
                _formatList.Add(_backgroundRevertStack.Pop());
            }
        }

        public void Append(string text)
        {
            var textNode = new TextNode(text);
            _formatList.Add(textNode);
        }

        public override string ToString()
        {
            var sb = new StringBuilder();

            foreach (var node in _formatList)
            {
                node.Evaluate(sb);
            }

            return sb.ToString();
        }
    }
}