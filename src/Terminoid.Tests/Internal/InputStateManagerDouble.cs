namespace Terminoid.Tests.Internal
{
    internal class InputStateManagerDouble : IInputStateManager
    {
        public object LastCommand { get; private set; }
        public object LastParameter { get; private set; }

        public void ExecuteCommand(IInputStateCommand command)
        {
            LastCommand = command;
            LastParameter = null;
        }

        public void ExecuteCommand<T>(IInputStateCommand<T> command, T parameter)
        {
            LastCommand = command;
            LastParameter = parameter;
        }
    }
}