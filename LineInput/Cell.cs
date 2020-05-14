namespace LineInput
{
    public class Cell
    {
        public char Char { get; set; }
        public Color Foreground { get; set; } = new Color(127, 127, 127);
        public Color? Background { get; set; }

        public Cell(char c) => Char = c;
        public Cell(char c, Color foreground) : this(c) => Foreground = foreground;
    }
}