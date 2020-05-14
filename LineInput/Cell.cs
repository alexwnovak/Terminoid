namespace LineInput
{
    public class Cell
    {
        public char Char { get; set; }
        public Color Foreground { get; set; } = new Color(127, 127, 127);

        public Cell(char c) => Char = c;
    }
}