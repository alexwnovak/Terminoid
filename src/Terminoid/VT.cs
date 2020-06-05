using System;
using System.Collections.Generic;
using LineInput;

namespace Terminoid
{
    internal static class VT
    {
        private static readonly Dictionary<ConsoleColor, string> _consoleColorTable = new Dictionary<ConsoleColor, string>
        {
            [ConsoleColor.Black] = "30",
            [ConsoleColor.DarkRed] = "31",
            [ConsoleColor.DarkGreen] = "32",
            [ConsoleColor.DarkYellow] = "33",
            [ConsoleColor.DarkBlue] = "34",
            [ConsoleColor.DarkMagenta] = "35",
            [ConsoleColor.DarkCyan] = "36",
            [ConsoleColor.Gray] = "37",
            [ConsoleColor.DarkGray] = "1;30"
        };

        public static string SetForeground(ConsoleColor color) => $"\x1B[{_consoleColorTable[color]}m";

        public static string SetForegroundRgb(Color color) => $"\x1B[38;2;{color.R};{color.G};{color.B}m";
        public static string ResetForeground() => "\x1B[39m";

        public static string SetBackgroundRgb(Color color) => $"\x1B[48;2;{color.R};{color.G};{color.B}m";
        public static string ResetBackground() => "\x1B[49m";
    }
}