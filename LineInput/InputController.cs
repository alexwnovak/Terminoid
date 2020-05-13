using System;
using LineInput.Commands;

namespace LineInput
{
    public class InputController : InputControllerBase
    {
        public override void PressKey(ConsoleKeyInfo keyInfo)
        {
            if (keyInfo.Key == ConsoleKey.LeftArrow)
            {
                InputStateManager.ExecuteCommand(new MoveCursorCommand(), -1);
            }
            else if (keyInfo.Key == ConsoleKey.RightArrow)
            {
                InputStateManager.ExecuteCommand(new MoveCursorCommand(), 1);
            }
            else if (keyInfo.Key == ConsoleKey.UpArrow)
            {
                InputStateManager.ExecuteCommand(new ClearLineCommand());
            }
            else if (keyInfo.Key == ConsoleKey.DownArrow)
            {
                // InputStateManager.ExecuteCommand(new InsertTextCommand(), "_one-two-three_");
                InputStateManager.ExecuteCommand(new AnimatedInsertTextCommand(TimeSpan.FromSeconds(1)), "this-is-some-animated-text");

            }
            else if (keyInfo.Key == ConsoleKey.Backspace)
            {
                InputStateManager.ExecuteCommand(new BackspaceCharacterCommand());
            }
            else
            {
                InputStateManager.ExecuteCommand(new InsertCharacterCommand(), keyInfo.KeyChar);
            }
        }
    }
}