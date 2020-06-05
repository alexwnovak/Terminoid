using System;
using System.Collections.Generic;

namespace Terminoid
{
    public class FormatBuilder
    {
        private readonly List<string> _sections = new List<string>();

        public void PushForeground(ConsoleColor color)
        {
            string format = VT.SetForeground(color);
            _sections.Add(format);
        }

        public void PopForeground()
        {
            string format = VT.ResetForeground();
            _sections.Add(format);
        }

        public void Append(string text)
        {
            _sections.Add(text);
        }

        public override string ToString() => string.Join(string.Empty, _sections);
    }
}