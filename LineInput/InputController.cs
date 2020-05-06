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

        protected virtual void OnInputChanged( object sender, EventArgs e) => InputChanged?.Invoke(this, e);

        public void Press( ConsoleKeyInfo keyInfo )
        {
            Console.WriteLine($"Got key {keyInfo.Key}");
        }

        public void PressKey( char key )
        {
            _sb.Append( key );
            CursorIndex++;
            OnInputChanged(this, EventArgs.Empty);
        }
    }
}