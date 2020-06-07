namespace Terminoid
{
    internal class WritableInputState : IWritableInputState
    {
        private readonly InputState _inputState;

        public int CursorIndex
        {
            get => _inputState.CursorIndex;
            set => _inputState.CursorIndex = value;
        }

        public TextBuffer TextBuffer => _inputState.TextBuffer;

        internal WritableInputState(InputState inputState)
        {
            _inputState = inputState;
        }
    }
}