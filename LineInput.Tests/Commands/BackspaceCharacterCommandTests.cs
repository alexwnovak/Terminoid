using Xunit;
using FluentAssertions;
using LineInput;
using LineInput.Commands;

namespace LineInput.Tests.Commands
{
    public class BackspaceCharacterCommandTests
    {
        [Fact]
        public void TheTextIsBlank_BackspacingACharacter_TextDoesNotChange()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new BackspaceCharacterCommand());

            inputState.Text.Should().BeEmpty();
        }

        [Fact]
        public void TheTextIsBlank_BackspacingACharacter_CursorIndexDoesNotChange()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new BackspaceCharacterCommand());

            inputState.CursorIndex.Should().Be(0);
        }

        [Fact]
        public void ThereIsText_BackspacingAtTheStartOfTheLine_TheTextDoesNotChange()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'a');
            inputStateManager.ExecuteCommand(new MoveCursorCommand(), -1);
            inputStateManager.ExecuteCommand(new BackspaceCharacterCommand());

            inputState.Text.Should().Be("a");
        }

        [Fact]
        public void ThereIsText_BackspacingAtTheStartOfTheLine_TheCursorPositionDoesNotChange()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'a');
            inputStateManager.ExecuteCommand(new MoveCursorCommand(), -1);
            inputStateManager.ExecuteCommand(new BackspaceCharacterCommand());

            inputState.CursorIndex.Should().Be(0);
        }

        [Fact]
        public void ThereIsText_BackspacingAtTheEndOfTheLine_TheCharacterToTheLeftOfTheCursorIsRemoved()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'a');
            inputStateManager.ExecuteCommand(new BackspaceCharacterCommand());

            inputState.Text.Should().BeEmpty();
        }

        [Fact]
        public void ThereIsText_BackspacingAtTheEndOfTheLine_TheCursorMovesLeftByOneSpot()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'a');
            inputStateManager.ExecuteCommand(new BackspaceCharacterCommand());

            inputState.CursorIndex.Should().Be(0);
        }
    }
}