namespace LineInput.Commands
{
    public class InsertCharacterCommand : IInputStateCommand<char>
    {
        public void Execute(WritableInputState inputState, char newCharacter)
        {
            inputState.StringBuilder.Insert(inputState.CursorIndex, newCharacter);
        }
    }
}