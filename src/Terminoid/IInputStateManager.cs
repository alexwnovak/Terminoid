namespace LineInput
{
    public interface IInputStateManager
    {
        void ExecuteCommand(IInputStateCommand command);
        void ExecuteCommand<T>(IInputStateCommand<T> command, T parameter);
    }
}