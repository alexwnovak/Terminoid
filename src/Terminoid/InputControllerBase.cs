using System;

namespace Terminoid
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