namespace Terminoid.Commands
{
    public class InsertTextCommand : IInputStateCommand<string>
    {
        public void Execute(IWritableInputState inputState, string parameter)
        {
            inputState.TextBuffer.Insert(inputState.CursorIndex, parameter);
            inputState.CursorIndex += parameter.Length;
        }
    }
}