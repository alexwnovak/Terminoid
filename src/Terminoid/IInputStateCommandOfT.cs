namespace Terminoid
{
    public interface IInputStateCommand<T>
    {
        void Execute(IWritableInputState inputState, T parameter );
    }
}