using Xunit;
using FluentAssertions;
using Terminoid.Commands;

namespace Terminoid.Tests.Commands
{
    public class InsertCharacterCommandTests
    {
        [Fact]
        public void TheTextIsBlank_TheUserPressesTheAKey_TheAKeyIsInserted()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'a');

            inputState.TextBuffer.ToString().Should().Be("a");
        }

        [Fact]
        public void TheTextIsBlank_TheUserPressesTheAKey_TheCursorIsPlacedAfterTheNewCharacter()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'a');

            inputState.CursorIndex.Should().Be(1);
        }

        [Fact]
        public void TheTextIsBlank_TheUserPressesQAndThenU_TheSecondCharacterIsAppended()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'q');
            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'u');

            inputState.TextBuffer.ToString().Should().Be("qu");
        }

        [Fact]
        public void TheCursorIsInTheMiddleOfTheText_TheUserPressesA_TheCharacterIsInsertedInTheMiddle()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'b');
            inputStateManager.ExecuteCommand(new MoveCursorCommand(), -1);
            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'a');

            inputState.TextBuffer.ToString().Should().Be("ab");
        }
    }
}