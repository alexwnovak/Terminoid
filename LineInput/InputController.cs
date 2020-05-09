using System;

namespace LineInput
{
    public class InputController : IInputController
    {
        private readonly InputStateManager _inputStateManager;

        public InputController(InputStateManager inputStateManager)
        {
            _inputStateManager = inputStateManager;
        }

        public void PressKey(ConsoleKeyInfo keyInfo)
        {
            if (keyInfo.Key == ConsoleKey.LeftArrow)
            {
                // if (CursorIndex > 0)
                // {
                //     CursorIndex--;
                // }
            }
            else if (keyInfo.Key == ConsoleKey.RightArrow)
            {
                // if (CursorIndex < GetBuffer().Length)
                // {
                //     CursorIndex++;
                // }
            }
            else if (keyInfo.Key == ConsoleKey.F1)
            {
                _inputStateManager.ExecuteCommand(new ClearLineCommand());
            }
            else
            {
                _inputStateManager.ExecuteCommand(new InsertCharacterCommand());
                // _sb.Append(keyInfo.KeyChar);
                // CursorIndex++;
            }
        }
    }
}