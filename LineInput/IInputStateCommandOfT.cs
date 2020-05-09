namespace LineInput
{
    public interface IInputStateCommand<T>
    {
        void Execute(WritableInputState inputState, T parameter );
    }
}