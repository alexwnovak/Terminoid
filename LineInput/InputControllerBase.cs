using System;

namespace LineInput
{
    public abstract class InputControllerBase : IInputController
    {
        public IInputStateManager InputStateManager
        {
            get;
            set;
        }

        public abstract void PressKey(ConsoleKeyInfo keyInfo);
    }
}