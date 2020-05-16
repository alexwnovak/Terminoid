namespace LineInput.Commands
{
    public class MoveCursorToEndCommand : IInputStateCommand
    {
        public void Execute(IWritableInputState inputState)
        {
            inputState.CursorIndex = inputState.TextBuffer.Length - 1;
        }
    }
}