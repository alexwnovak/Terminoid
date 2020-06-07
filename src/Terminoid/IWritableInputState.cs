namespace Terminoid
{
    public interface IWritableInputState
    {
        int CursorIndex { get; set; }
        TextBuffer TextBuffer { get; }
    }
}