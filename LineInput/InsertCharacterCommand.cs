namespace LineInput
{
    public class InsertCharacterCommand : InputStateCommandBase
    {
        public override void Execute(WritableInputState inputState)
        {
            inputState.StringBuilder.Insert(inputState.CursorIndex, 'q');
        }
    }
}