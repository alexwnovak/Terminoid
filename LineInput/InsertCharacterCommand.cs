namespace LineInput
{
    public class InsertCharacterCommand : IInputStateCommand
    {
        public void Execute(WritableInputState inputState)
        {
            inputState.StringBuilder.Insert(inputState.CursorIndex, 'q');
        }
    }
}