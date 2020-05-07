using System;

namespace LineInput
{
    public interface IInputController
    {
        int CursorIndex { get; }
        event EventHandler InputChanged;
        string GetBuffer();
        void PressKey(char key);
    }
}