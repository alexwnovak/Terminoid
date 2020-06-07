using System;
using System.Text;
using Terminoid;

namespace LineInput
{
    internal class BackgroundColorNode : FormatTreeNode
    {
        private Color? _color;
        private ConsoleColor? _consoleColor;

        public BackgroundColorNode(Color color) => _color = color;
        public BackgroundColorNode(ConsoleColor color) => _consoleColor = color;

        private void EvaluateRgb(StringBuilder sb)
        {
            if (_color.Value.IsEmpty)
            {
                sb.Append(VT.ResetBackground());
            }
            else
            {
                sb.Append(VT.SetBackgroundRgb(_color.Value));
            }
        }

        private void EvaluateConsoleColor(StringBuilder sb)
        {
            sb.Append(VT.SetBackground(_consoleColor.Value));
        }

        public override void Evaluate(StringBuilder sb)
        {
            if (_color != null)
            {
                EvaluateRgb(sb);
            }
            else if (_consoleColor != null)
            {
                EvaluateConsoleColor(sb);
            }

            EvaluateChildren(sb);
        }
    }
}