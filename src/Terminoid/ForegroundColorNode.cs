using System;
using System.Text;
using Terminoid;

namespace LineInput
{
    internal class ForegroundColorNode : FormatTreeNode
    {
        private readonly Color? _color;
        private readonly ConsoleColor? _consoleColor;

        public ForegroundColorNode(Color color) => _color = color;
        public ForegroundColorNode(ConsoleColor color) => _consoleColor = color;

        private void EvaluateRgb(StringBuilder sb)
        {
            if (_color.Value.IsEmpty)
            {
                sb.Append(VT.ResetForeground());
            }
            else
            {
                sb.Append(VT.SetForegroundRgb(_color.Value));
            }
        }

        private void EvaluateConsoleColor(StringBuilder sb)
        {
            sb.Append(VT.SetForeground(_consoleColor.Value));
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