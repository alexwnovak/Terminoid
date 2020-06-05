using System;
using System.Collections.Generic;
using LineInput;

namespace Terminoid
{
    internal static class VT
    {
        private static readonly Dictionary<ConsoleColor, int> _consoleColorTable = new Dictionary<ConsoleColor, int>
        {
            [ConsoleColor.Black] = 30,
            [ConsoleColor.Red] = 31,
            [ConsoleColor.Green] = 32,
            [ConsoleColor.Yellow] = 33,
            [ConsoleColor.Blue] = 34,
            [ConsoleColor.Magenta] = 35,
            [ConsoleColor.Cyan] = 36,
            [ConsoleColor.Gray] = 37
        };

        public static string SetForeground(ConsoleColor color) => $"\x1B[{_consoleColorTable[color]}m";

        public static string SetForegroundRgb(Color color) => $"\x1B[38;2;{color.R};{color.G};{color.B}m";
        public static string ResetForeground() => "\x1B[39m";

        public static string SetBackgroundRgb(Color color) => $"\x1B[48;2;{color.R};{color.G};{color.B}m";
        public static string ResetBackground() => "\x1B[49m";
    }
}