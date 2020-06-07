using System;

namespace Terminoid.Tests.Internal
{
    internal static class KeyFactory
    {
        public static ConsoleKeyInfo FromChar(char c, ConsoleKey key = ConsoleKey.NoName, bool shift = false, bool alt = false, bool control = false)
        {
            return new ConsoleKeyInfo(c, key, shift, alt, control);
        }

        public static ConsoleKeyInfo FromKey(ConsoleKey key, bool shift = false, bool alt = false, bool control = false)
        {
            return new ConsoleKeyInfo('\0', key, shift, alt, control);
        }
    }
}