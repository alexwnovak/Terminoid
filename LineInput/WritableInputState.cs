using System.Text;

namespace LineInput
{
    public class WritableInputState
    {
        private readonly InputState _inputState;

        public int CursorIndex
        {
            get => _inputState.CursorIndex;
            set => _inputState.CursorIndex = value;
        }

        public StringBuilder StringBuilder => _inputState.StringBuilder;

        internal WritableInputState(InputState inputState)
        {
            _inputState = inputState;
        }
    }
}