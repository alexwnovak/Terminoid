using Xunit;
using FluentAssertions;
using LineInput;
using LineInput.Commands;

namespace LineInput.Tests.Commands
{
    public class MoveCursorToEndCommandTests
    {
        [Fact]
        public void TheTextIsBlank_MovingCursorToEnd_CursorDoesNotMove()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new MoveCursorToEndCommand());

            inputState.CursorIndex.Should().Be(0);
        }

        [Fact]
        public void TheCursorIsInTheMiddleOfTheText_MovingCursorToEnd_TheCursorJumpsToTheEndOfTheLine()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'a');
            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'b');
            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'c');
            inputStateManager.ExecuteCommand(new MoveCursorCommand(), -1);
            inputStateManager.ExecuteCommand(new MoveCursorCommand(), -1);
            inputStateManager.ExecuteCommand(new MoveCursorCommand(), -1);
            inputStateManager.ExecuteCommand(new MoveCursorToEndCommand());

            inputState.CursorIndex.Should().Be(3);
        }
    }
}