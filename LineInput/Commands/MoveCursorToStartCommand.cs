namespace LineInput.Commands
{
    public class MoveCursorToStartCommand : IInputStateCommand
    {
        public void Execute(IWritableInputState inputState)
        {
            inputState.CursorIndex = 0;
        }
    }
}