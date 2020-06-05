using System;
using System.Collections.Generic;
using LineInput;

namespace Terminoid
{
    public class FormatBuilder
    {
        private readonly List<string> _sections = new List<string>();
        private bool _hasForeground;

        public void PushForeground(ConsoleColor color)
        {
            string format = VT.SetForeground(color);
            _sections.Add(format);

            _hasForeground = true;
        }

        public void PushForeground(Color color)
        {
            string format = VT.SetForegroundRgb(color);
            _sections.Add(format);
        }

        public void PopForeground()
        {
            if (_hasForeground)
            {
                string format = VT.ResetForeground();
                _sections.Add(format);
                _hasForeground = false;
            }
        }

        public void Append(string text)
        {
            _sections.Add(text);
        }

        public override string ToString() => string.Join(string.Empty, _sections);
    }
}