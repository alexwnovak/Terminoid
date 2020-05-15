namespace LineInput.Commands
{
    public class BackspaceCharacterCommand : IInputStateCommand
    {
        public void Execute(IWritableInputState inputState)
        {
            if (inputState.CursorIndex > 0)
            {
                inputState.TextBuffer.Remove(inputState.CursorIndex - 1);
                inputState.CursorIndex--;
            }
        }
    }
}