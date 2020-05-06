using System.Text;

namespace LineInput
{
    public class InputController : IInputController
    {
        private readonly StringBuilder _sb = new StringBuilder();

        public int CursorIndex { get; private set; }
        public string Buffer => _sb.ToString();

        public void PressKey( char key )
        {
            _sb.Append( key );
            CursorIndex++;

            System.Console.WriteLine($"Got {key}, code {(int)key}");
        }
    }
}