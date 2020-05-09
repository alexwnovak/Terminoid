using System;

namespace LineInput
{
    public abstract class InputControllerBase : IInputController
    {
        public InputStateManager InputStateManager
        {
            get;
            set;
        }

        public abstract void PressKey(ConsoleKeyInfo keyInfo);
    }
}