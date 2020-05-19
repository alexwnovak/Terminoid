using System;
using Xunit;
using FluentAssertions;
using LineInput;
using LineInput.Commands;
using LineInput.Tests.Internal;

namespace LineInput.Tests
{
    public class InputControllerTests
    {
        [Fact]
        public void GivenTheInputControllerExists_WhenTheLeftArrowIsPressed_TheMoveCursorCommandIsExecuted()
        {
            var inputStateManager = new InputStateManagerDouble();

            var inputController = new InputController
            {
                InputStateManager = inputStateManager
            };

            inputController.PressKey(KeyFactory.FromKey(ConsoleKey.LeftArrow));

            inputStateManager.LastCommand.Should().BeOfType<MoveCursorCommand>();
            inputStateManager.LastParameter.Should().Be(-1);
        }
    }
}