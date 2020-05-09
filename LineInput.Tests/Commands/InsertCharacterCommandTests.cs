using Xunit;
using FluentAssertions;
using LineInput;
using LineInput.Commands;

namespace LineInput.Tests.Commands
{
    public class InsertCharacterCommandTests
    {
        [Fact]
        public void TheTextIsBlank_TheUserPressesTheAKey_TheAKeyIsInserted()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            inputStateManager.ExecuteCommand(new InsertCharacterCommand(), 'a');

            inputState.Text.Should().Be("a");
        }
    }
}