using Xunit;
using FluentAssertions;

namespace Terminoid.Tests
{
    public class InputStateTests
    {
        [Fact]
        public void CursorIndex_ByDefault_IsAtPosition0()
        {
            var inputState = new InputState();

            inputState.CursorIndex.Should().Be(0);
        }

        [Fact]
        public void Text_ByDefault_IsEmpty()
        {
            var inputState = new InputState();

            inputState.TextBuffer.ToString().Should().BeEmpty();
        }
    }
}