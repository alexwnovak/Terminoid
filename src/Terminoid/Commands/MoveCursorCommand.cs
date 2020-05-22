namespace LineInput.Commands
{
    public class MoveCursorCommand : IInputStateCommand<int>
    {
        public void Execute(IWritableInputState inputState, int parameter)
        {
            int newIndex = inputState.CursorIndex + parameter;

            if (newIndex < 0)
            {
                inputState.CursorIndex = 0;
            }
            else if (newIndex >= inputState.TextBuffer.Length)
            {
                inputState.CursorIndex = inputState.TextBuffer.Length - 1;
            }
            else
            {
                inputState.CursorIndex += parameter;
            }
        }
    }
}