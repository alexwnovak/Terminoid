namespace LineInput.Commands
{
    public class MoveCursorCommand : IInputStateCommand<int>
    {
        public void Execute(IWritableInputState inputState, int parameter)
        {
            inputState.CursorIndex += parameter;
        }
    }
}