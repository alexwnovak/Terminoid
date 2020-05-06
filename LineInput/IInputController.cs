namespace LineInput
{
    public interface IInputController
    {
        string GetBuffer();
        void PressKey(char key);
    }
}