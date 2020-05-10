namespace LineInput.Commands
{
    public class ClearLineCommand : IInputStateCommand
    {
        public void Execute(IWritableInputState inputState)
        {
            inputState.StringBuilder.Clear();
            inputState.CursorIndex = 0;
        }
    }
}