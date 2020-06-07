using Xunit;
using FluentAssertions;
using Terminoid.Commands;

namespace Terminoid.Tests.Commands
{
    public class MoveCursorToEndCommandTests
    {
        [Fact]
        public void GivenTheTextIsBlank_WhenMovingCursorToEnd_ThenCursorDoesNotMove()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new MoveCursorToEndCommand());

            inputState.CursorIndex.Should().Be(0);
        }

        [Fact]
        public void GivenTheCursorIsInTheMiddleOfTheText_WhenMovingCursorToEnd_ThenTheCursorJumpsToTheEndOfTheLine()
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