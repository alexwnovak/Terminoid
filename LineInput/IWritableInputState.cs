using System.Text;

namespace LineInput
{
    public interface IWritableInputState
    {
        int CursorIndex { get; set; }
        StringBuilder StringBuilder { get; }
    }
}