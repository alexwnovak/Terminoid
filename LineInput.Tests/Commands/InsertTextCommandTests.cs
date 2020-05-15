using Xunit;
using FluentAssertions;
using LineInput;
using LineInput.Commands;

namespace LineInput.Tests.Commands
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