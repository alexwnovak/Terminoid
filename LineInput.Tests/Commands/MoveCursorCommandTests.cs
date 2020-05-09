using Xunit;
using FluentAssertions;
using LineInput;
using LineInput.Commands;

namespace LineInput.Tests.Commands
{
    public class MoveCursorCommandTests
    {
        [Fact]
        public void TheTextIsBlank_MovingCursorOnePositionLeft_TheCursorDoesNotMove()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new MoveCursorCommand(), -1);

            inputState.CursorIndex.Should().Be(0);
        }

        [Fact]
        public void TheTextIsBlank_MovingCursorOnePositionRight_TheCursorDoesNotMove()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new MoveCursorCommand(), 1);

            inputState.CursorIndex.Should().Be(0);
        }
    }
}