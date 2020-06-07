using System;
using System.Collections.Generic;

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
            [ConsoleColor.DarkGray] = "1;30",
            [ConsoleColor.Red] = "1;31",
            [ConsoleColor.Green] = "1;32",
            [ConsoleColor.Yellow] = "1;33",
            [ConsoleColor.Blue] = "1;34",
            [ConsoleColor.Magenta] = "1;35",
            [ConsoleColor.Cyan] = "1;36",
            [ConsoleColor.White] = "1;37",
        };

        private static readonly Dictionary<ConsoleColor, int> _table = new Dictionary<ConsoleColor, int>
        {
            [ConsoleColor.Black] = 30,
            [ConsoleColor.DarkRed] = 31,
            [ConsoleColor.DarkGreen] = 32,
            [ConsoleColor.DarkYellow] = 33,
            [ConsoleColor.DarkBlue] = 34,
            [ConsoleColor.DarkMagenta] = 35,
            [ConsoleColor.DarkCyan] = 36,
            [ConsoleColor.Gray] = 37,
        };

        private static bool IsBright(ConsoleColor color) => (int) color >= 8;
        private static ConsoleColor AsDark(ConsoleColor color)
        {
            if (IsBright(color))
            {
                return (ConsoleColor)((int) color - 8);
            }

            return color;
        }

        public static string SetForeground(ConsoleColor color)
        {
            if (IsBright(color))
            {
                int colorVTNumber = _table[AsDark(color)];
                return $"\x1B[1;{colorVTNumber}m";
            }

            return $"\x1B[{_table[color]}m";
        }

        public static string SetBackground(ConsoleColor color)
        {
            // The background colors are the same as the foreground, just 10 higher.
            // Instead of storing both, we can just add 10 to the foreground.

            if (IsBright(color))
            {
                int colorVTNumber = 10 + _table[AsDark(color)];
                return $"\x1B[1;{colorVTNumber}m";
            }

            return $"\x1B[{10 + _table[color]}m";
        }

        public static string SetForegroundRgb(Color color) => $"\x1B[38;2;{color.R};{color.G};{color.B}m";
        public static string ResetForeground() => "\x1B[39m";

        public static string SetBackgroundRgb(Color color) => $"\x1B[48;2;{color.R};{color.G};{color.B}m";
        public static string ResetBackground() => "\x1B[49m";
    }
}