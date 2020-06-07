namespace Terminoid.Commands
{
    public class InsertCharacterCommand : IInputStateCommand<char>
    {
        public void Execute(IWritableInputState inputState, char newCharacter)
        {
            inputState.TextBuffer.Insert(inputState.CursorIndex, new Cell(newCharacter));
            inputState.CursorIndex++;
        }
    }
}