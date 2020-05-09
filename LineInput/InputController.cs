using System;

namespace LineInput
{
    public class InputController : InputControllerBase
    {
        public override void PressKey(ConsoleKeyInfo keyInfo)
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
                InputStateManager.ExecuteCommand(new ClearLineCommand());
            }
            else
            {
                InputStateManager.ExecuteCommand(new InsertCharacterCommand());
            }
        }
    }
}