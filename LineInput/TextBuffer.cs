using System.Collections.Generic;
using System.Linq;

namespace LineInput
{
    public class TextBuffer
    {
        private readonly List<Cell> _cells = new List<Cell>
        {
            new Cell(' ')
        };

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
        public void Append(string s)
        {
            var cells = s.Select(c => new Cell(c));
            Append(cells);
        }

        public void Insert(int index, Cell cell) => _cells.Insert(index, cell);
        public void Insert(int index, char c) => Insert(index, new Cell(c));
        public void Insert(int index, string s)
        {
            var cells = s.Select(c => new Cell(c));
            _cells.InsertRange(index, cells);
        }

        public void Remove(int index) => _cells.RemoveAt(index);

        public void Clear() => _cells.Clear();

        public override string ToString()
        {
            var chars = _cells.Select(c => c.Char).ToArray();
            return new string(chars);
        }
    }
}