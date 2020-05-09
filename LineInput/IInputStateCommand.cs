namespace LineInput
{
    public interface IInputStateCommand
    {
        void Execute(WritableInputState inputState, object[] parameters);
    }
}