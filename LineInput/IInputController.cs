using System;

namespace LineInput
{
    public interface IInputController
    {
        int CursorIndex { get; }
        string GetBuffer();
        void PressKey(ConsoleKeyInfo keyInfo);
    }
}