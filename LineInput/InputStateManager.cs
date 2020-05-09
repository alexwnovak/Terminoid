namespace LineInput
{
    public class InputStateManager
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
            command.Execute(GetWritableInputState());
        }

        public void ExecuteCommand<T>(IInputStateCommand<T> command, T parameter)
        {
            command.Execute(GetWritableInputState(), parameter);
        }
    }
}