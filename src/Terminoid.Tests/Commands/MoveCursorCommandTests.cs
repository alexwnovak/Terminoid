using Xunit;
using FluentAssertions;
using Terminoid.Commands;

namespace Terminoid.Tests.Commands
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
        public void GivenNoTextHasBeenAdded_WhenMovingCursorOnePositionRight_ThenTheCursorRemainsAtTheEnd()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new MoveCursorCommand(), 1);

            inputState.CursorIndex.Should().Be(0);
        }

        [Fact]
        public void TheCursorIsAtTheEndOfTheText_MovingCursorOnePositionLeft_TheCursorMoves()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'q');
            inputStateManager.ExecuteCommand(new MoveCursorCommand(), -1);

            inputState.CursorIndex.Should().Be(0);
        }

        [Fact]
        public void TheCursorAtTheStartOfTheText_MovingCursorOnePositionRight_TheCursorMoves()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'q');
            inputStateManager.ExecuteCommand(new MoveCursorCommand(), -1);
            inputStateManager.ExecuteCommand(new MoveCursorCommand(), 1);

            inputState.CursorIndex.Should().Be(1);
        }

        [Fact]
        public void TheCursorIsAtTheEndOfTheText_MovingCursorLeftPastTheStart_TheCursorIsClampedToTheStart()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'q');
            inputStateManager.ExecuteCommand(new MoveCursorCommand(), -100);

            inputState.CursorIndex.Should().Be(0);
        }

        [Fact]
        public void TheCursorAtTheStartOfTheText_MovingCursorRightPastTheEnd_TheCursorIsClampedToTheEnd()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'q');
            inputStateManager.ExecuteCommand(new MoveCursorCommand(), -1);
            inputStateManager.ExecuteCommand(new MoveCursorCommand(), 100);

            inputState.CursorIndex.Should().Be(1);
        }
    }
}