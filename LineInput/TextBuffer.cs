using System.Collections.Generic;

namespace LineInput
{
    public class TextBuffer
    {
        private readonly List<Cell> _cells = new List<Cell>();

        public int Length => _cells.Count;
    }
}