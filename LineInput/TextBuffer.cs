using System;
using System.Collections.Generic;

namespace LineInput
{
    public class TextBuffer
    {
        private readonly List<Cell> _cells = new List<Cell>();

        public int Length => _cells.Count;

        public Cell this[int index] => _cells[index];

        public TextBuffer()
        {
        }

        public TextBuffer(IEnumerable<Cell> cells)
        {
            _cells.AddRange(cells);
        }

        public void Append(Cell cell) => _cells.Add(cell);
    }
}