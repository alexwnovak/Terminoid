using System.Text;

namespace LineInput
{
    public class InputController
    {
        private readonly StringBuilder _sb = new StringBuilder();

        public int CursorIndex { get; set; }
        public string Buffer => _sb.ToString();

        public void PressKey( char key )
        {
            _sb.Append( key );
            CursorIndex++;
        }
    }
}