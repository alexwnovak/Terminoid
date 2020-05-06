namespace LineInput
{
    public class InputController
    {
        public int CursorIndex { get; set; }
        public string Buffer { get; private set; } = string.Empty;

        public void PressKey( char key )
        {
            Buffer += key;
        }
    }
}