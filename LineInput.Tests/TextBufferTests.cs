using Xunit;
using FluentAssertions;
using LineInput;

namespace LineInput.Tests
{
    public class TextBufferTests
    {
        [Fact]
        public void ByDefault_WhenReadingLengthProperty_TheLengthIsZero()
        {
            var textBuffer = new TextBuffer();

            textBuffer.Length.Should().Be(0);
        }

    }
}