using System;

namespace LineInput
{
    public interface IInputController
    {
        event EventHandler InputChanged;
        string GetBuffer();
        void PressKey(char key);
    }
}