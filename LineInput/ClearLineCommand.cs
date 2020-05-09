namespace LineInput
{
    public class ClearLineCommand : InputStateCommandBase
    {
        public override void Execute(WritableInputState inputState)
        {
            inputState.StringBuilder.Clear();
        }
    }
}