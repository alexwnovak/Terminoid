using System;
using System.Diagnostics;
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

        [Fact]
        public void TheBufferIsEmpty_ReadingTheFirstIndex_ThrowsArgumentOutOfRangeException()
        {
            var textBuffer = new TextBuffer();

            Action indexer = () => Trace.WriteLine(textBuffer[0]);

            indexer.Should().Throw<ArgumentOutOfRangeException>();
        }

        [Fact]
        public void TheBufferIsInitiallyEmpty_AddingACell_TheNewCellCanBeReadByIndexerAndIsTheSameInstance()
        {
            var textBuffer = new TextBuffer();

            var cell = new Cell('A');
            textBuffer.Append(cell);

            textBuffer[0].Should().Be(cell);
        }
    }
}