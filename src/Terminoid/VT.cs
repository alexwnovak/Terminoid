namespace LineInput
{
    internal static class VT
    {
        public static string SetForegroundRgb(Color color) => $"\x1B[38;2;{color.R};{color.G};{color.B}m";
        public static string ResetForeground() => "\x1B[39m";

        public static string SetBackgroundRgb(Color color) => $"\x1B[48;2;{color.R};{color.G};{color.B}m";
        public static string ResetBackground() => "\x1B[49m";
    }
}