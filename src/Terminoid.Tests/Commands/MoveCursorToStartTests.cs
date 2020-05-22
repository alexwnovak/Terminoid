using Xunit;
using FluentAssertions;
using LineInput;
using LineInput.Commands;

namespace LineInput.Tests.Commands
{
    public class MoveCursorToStartTests
    {
        [Fact]
        public void TheTextIsBlank_MovingCursorToStart_CursorDoesNotMove()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new MoveCursorToStartCommand());

            inputState.CursorIndex.Should().Be(0);
        }

        [Fact]
        public void TheCursorIsInTheMiddleOfTheText_MovingCursorToStart_TheCursorJumpsToTheStartOfTheLine()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'a');
            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'b');
            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'c');
            inputStateManager.ExecuteCommand(new MoveCursorToStartCommand());

            inputState.CursorIndex.Should().Be(0);
        }
    }
}