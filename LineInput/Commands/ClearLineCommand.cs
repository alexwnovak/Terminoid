namespace LineInput.Commands
{
    public class ClearLineCommand : IInputStateCommand
    {
        public void Execute(IWritableInputState inputState)
        {
            inputState.TextBuffer.Clear();
            inputState.CursorIndex = 0;
        }
    }
}