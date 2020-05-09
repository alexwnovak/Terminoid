namespace LineInput.Commands
{
    public class MoveCursorCommand : IInputStateCommand<int>
    {
        public void Execute(WritableInputState inputState, int parameter)
        {
            inputState.CursorIndex += parameter;
        }
    }
}