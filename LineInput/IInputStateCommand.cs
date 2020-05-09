namespace LineInput
{
    public interface IInputStateCommand
    {
        void Execute(IWritableInputState inputState);
    }
}