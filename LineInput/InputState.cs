using System.Text;

namespace LineInput
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

        private readonly StringBuilder _sb = new StringBuilder();
        public string Text
        {
            get
            {
                lock (_syncObject)
                {
                    return _sb.ToString();
                }
            }
        }
    }
}