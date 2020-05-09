namespace LineInput
{
    public class InputStateManager
    {
        private readonly InputState _inputState;

        public InputStateManager(InputState inputState)
        {
            _inputState = inputState;
        }

        public void ExecuteCommand(IInputStateCommand command, params object[] parameters)
        {
            var writeableInputState = new WritableInputState(_inputState);
            command.Execute(writeableInputState, parameters);
        }
    }
}