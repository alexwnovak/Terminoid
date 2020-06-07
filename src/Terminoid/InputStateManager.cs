namespace Terminoid
{
    public class InputStateManager : IInputStateManager
    {
        private readonly InputState _inputState;

        public InputStateManager(InputState inputState)
        {
            _inputState = inputState;
        }

        private WritableInputState GetWritableInputState()
        {
            return new WritableInputState(_inputState);
        }

        public void ExecuteCommand(IInputStateCommand command)
        {
            lock (_inputState)
            {
                command.Execute(GetWritableInputState());
            }
        }

        public void ExecuteCommand<T>(IInputStateCommand<T> command, T parameter)
        {
            lock (_inputState)
            {
                command.Execute(GetWritableInputState(), parameter);
            }
        }
    }
}