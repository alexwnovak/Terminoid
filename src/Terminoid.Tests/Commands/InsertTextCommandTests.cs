using Xunit;
using FluentAssertions;
using Terminoid.Commands;

namespace Terminoid.Tests.Commands
{
    public class InsertTextCommandTests
    {
        [Fact]
        public void TheTextIsBlank_InsertingSomeText_TheTextIsInserted()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertTextCommand(), "the-text");

            inputState.TextBuffer.ToString().Should().Be("the-text");
        }

        [Fact]
        public void TheTextIsBlank_InsertingSomeText_TheCursorMovesToTheEndOfTheText()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertTextCommand(), "the-text");

            inputState.CursorIndex.Should().Be(8);
        }
    }
}