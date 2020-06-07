using System;
using Xunit;
using FluentAssertions;
using Terminoid;
using Terminoid.Commands;
using Terminoid.Tests.Internal;

namespace Terminoid.Tests
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

        [Fact]
        public void GivenTheInputControllerExists_WhenTheRightArrowIsPressed_TheMoveCursorCommandIsExecuted()
        {
            var inputStateManager = new InputStateManagerDouble();

            var inputController = new InputController
            {
                InputStateManager = inputStateManager
            };

            inputController.PressKey(KeyFactory.FromKey(ConsoleKey.RightArrow));

            inputStateManager.LastCommand.Should().BeOfType<MoveCursorCommand>();
            inputStateManager.LastParameter.Should().Be(1);
        }
    }
}