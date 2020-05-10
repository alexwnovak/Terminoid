using System;

namespace LineInput.Commands
{
    public class BackspaceCharacterCommand : IInputStateCommand
    {
        public void Execute(IWritableInputState inputState)
        {
            if (inputState.CursorIndex > 0)
            {
                inputState.StringBuilder.Remove(inputState.CursorIndex - 1, 1);
                inputState.CursorIndex--;
            }
        }
    }
}