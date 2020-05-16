using System.Collections.Generic;
using System.Linq;

namespace LineInput
{
    public class TextBuffer
    {
        private readonly Cell _blank = new Cell(' ');
        private readonly List<Cell> _cells;

        public int Length => _cells.Count;
        public bool IsEmpty => _cells.Count == 1 && _cells[0] == _blank;

        public Cell this[int index] => _cells[index];

        public TextBuffer()
        {
            // This blank cell represents the end of the line where the cursor can safely rest.
            // Each time we modify the list of cells, this one should always be at the very end.
            _cells = new List<Cell> { _blank };
        }

        public TextBuffer(IEnumerable<Cell> cells) : this()
        {
            Append(cells);
        }

        private void AddBlankCell() => _cells.Add(_blank);
        private void RemoveBlankCell() => _cells.Remove(_blank);

        public void Append(Cell cell)
        {
            RemoveBlankCell();
            _cells.Add(cell);
            AddBlankCell();
        }

        public void Append(IEnumerable<Cell> cells)
        {
            RemoveBlankCell();
            _cells.AddRange(cells);
            AddBlankCell();
        }

        public void Append(string s)
        {
            RemoveBlankCell();
            var newCells = s.Select(c => new Cell(c));
            _cells.AddRange(newCells);
            AddBlankCell();
        }

        public void Insert(int index, Cell cell) => _cells.Insert(index, cell);
        public void Insert(int index, char c) => Insert(index, new Cell(c));
        public void Insert(int index, string s)
        {
            var cells = s.Select(c => new Cell(c));
            _cells.InsertRange(index, cells);
        }

        public void Remove(int index) => _cells.RemoveAt(index);

        public void Clear() => _cells.RemoveRange(0, _cells.Count - 1);

        public override string ToString()
        {
            var chars = _cells.TakeWhile(c => c != _blank).Select(c => c.Char).ToArray();
            return new string(chars);
        }

        public string ToFullString()
        {
            var chars = _cells.Select(c => c.Char).ToArray();
            return new string(chars);
        }
    }
}