using System;
using System.Text;

namespace LineInput
{
    public class InputController : IInputController
    {
        private readonly object _syncObject = new object();
        private readonly StringBuilder _sb = new StringBuilder();

        private readonly InputStateManager _inputStateManager;

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
            private set
            {
                lock (_syncObject)
                {
                    _cursorIndex = value;
                }
            }
        }

        public string GetBuffer() => _sb.ToString();

        public InputController(InputStateManager inputStateManager)
        {
            _inputStateManager = inputStateManager;
        }

        public void PressKey(ConsoleKeyInfo keyInfo)
        {
            if (keyInfo.Key == ConsoleKey.LeftArrow)
            {
                if (CursorIndex > 0)
                {
                    CursorIndex--;
                }
            }
            else if (keyInfo.Key == ConsoleKey.RightArrow)
            {
                if (CursorIndex < GetBuffer().Length)
                {
                    CursorIndex++;
                }
            }
            else if (keyInfo.Key == ConsoleKey.F1)
            {
                _inputStateManager.ExecuteCommand(new ClearLineCommand());
            }
            else
            {
                _inputStateManager.ExecuteCommand(new InsertCharacterCommand());
                // _sb.Append(keyInfo.KeyChar);
                // CursorIndex++;
            }
        }
    }
}