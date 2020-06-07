namespace Terminoid
{
    public class InputState
    {
        private readonly object _syncObject = new object();

        private int _cursorIndex;
        public int CursorIndex
        {
            get
            {
                lock (_syncObject)
                {
                    return _cursorIndex;
                }
            }
            internal set
            {
                lock (_syncObject)
                {
                    _cursorIndex = value;
                }
            }
        }

        private readonly TextBuffer _textBuffer = new TextBuffer();
        public TextBuffer TextBuffer
        {
            get
            {
                lock (_syncObject)
                {
                    return _textBuffer;
                }
            }
        }
    }
}