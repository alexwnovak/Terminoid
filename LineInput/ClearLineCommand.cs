namespace LineInput
{
    public class ClearLineCommand : IInputStateCommand
    {
        public void Execute(WritableInputState inputState)
        {
            inputState.StringBuilder.Clear();
        }
    }
}