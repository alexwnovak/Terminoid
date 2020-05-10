using Xunit;
using FluentAssertions;
using LineInput;
using LineInput.Commands;

namespace LineInput.Tests.Commands
{
    public class ClearLineCommandTests
    {
        [Fact]
        public void TheTextIsBlank_ClearingTheText_TextIsStillBlank()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new ClearLineCommand());

            inputState.Text.Should().BeEmpty();
        }

        [Fact]
        public void ThereIsText_ClearingTheText_TheTextIsCleared()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'a');
            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'b');
            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'c');
            inputStateManager.ExecuteCommand(new ClearLineCommand());

            inputState.Text.Should().BeEmpty();
        }

        [Fact]
        public void ThereIsText_ClearingTheText_CursorIsPlacedBackAt0()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'a');
            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'b');
            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'c');
            inputStateManager.ExecuteCommand(new ClearLineCommand());

            inputState.CursorIndex.Should().Be(0);
        }
    }
}