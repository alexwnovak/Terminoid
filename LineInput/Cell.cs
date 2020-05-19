namespace LineInput
{
    public class Cell
    {
        public static readonly Color DefaultForeground = Color.FromRgb(127, 127, 127);

        public char Char { get; set; }
        public Color Foreground { get; set; } = Color.Empty();
        public Color Background { get; set; } = Color.Empty();

        public Cell(char c) => Char = c;
        public Cell(char c, Color foreground) : this(c) => Foreground = foreground;
        public Cell(char c, Color foreground, Color background) : this(c, foreground) => Background = background;
    }
}