using System;

namespace LineInput
{
    public static class ConsoleKeyInfoExtensions
    {
        public static bool HasAnyModifier(this ConsoleKeyInfo consoleKeyInfo)
        {
            return consoleKeyInfo.Modifiers != 0;
        }
    }
}