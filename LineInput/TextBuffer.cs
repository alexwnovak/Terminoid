using System;
using System.Collections.Generic;
using System.Linq;

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
            Append(cells);
        }

        public void Append(Cell cell) => _cells.Add(cell);
        public void Append(IEnumerable<Cell> cells) => _cells.AddRange(cells);

        public void Clear() => _cells.Clear();

        public override string ToString()
        {
            var chars = _cells.Select(c => c.Char).ToArray();
            return new string(chars);
        }
    }
}