using System.ComponentModel;

namespace LineInput
{
    public abstract class InputStateCommandBase : IInputStateCommand
    {
        public abstract void Execute(WritableInputState inputState);

        [EditorBrowsable(EditorBrowsableState.Never)]
        public void Execute(WritableInputState inputState, object[] parameters)
        {
            // In this command base, we don't care about parameters, so disregard
            // the parameters array. The protected abstract Execute method is the
            // method to override for inheritors and this method can be ignored.
            Execute(inputState);
        }
    }
}