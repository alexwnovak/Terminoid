namespace Terminoid
{
    public interface IInputStateCommand
    {
        void Execute(IWritableInputState inputState);
    }
}