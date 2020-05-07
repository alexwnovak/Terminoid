using System;
using System.Text;

namespace LineInput
{
    public class InputController : IInputController
    {
        private readonly StringBuilder _sb = new StringBuilder();

        public int CursorIndex { get; private set; }
        public string GetBuffer() => _sb.ToString();

        public event EventHandler InputChanged;

        protected virtual void OnInputChanged(object sender, EventArgs e) => InputChanged?.Invoke(this, e);

        public void PressKey(ConsoleKeyInfo keyInfo)
        {
            if (keyInfo.Key == ConsoleKey.LeftArrow)
            {
                CursorIndex--;
            }
            else
            {
                _sb.Append(keyInfo.KeyChar);
                CursorIndex++;
                OnInputChanged(this, EventArgs.Empty);
            }
        }
    }
}