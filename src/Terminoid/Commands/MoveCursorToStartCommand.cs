namespace Terminoid.Commands
{
    public class MoveCursorToStartCommand : IInputStateCommand
    {
        public void Execute(IWritableInputState inputState)
        {
            inputState.CursorIndex = 0;
        }
    }
}