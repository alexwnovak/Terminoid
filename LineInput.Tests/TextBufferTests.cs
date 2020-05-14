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

        [Fact]
        public void CreatingFreshInstance_CreatingUsingCells_TheCellsAreAdded()
        {
            var cells = new[]
            {
                new Cell('A'),
                new Cell('B'),
                new Cell('C')
            };

            var textBuffer = new TextBuffer(cells);

            textBuffer[0].Should().Be(cells[0]);
            textBuffer[1].Should().Be(cells[1]);
            textBuffer[2].Should().Be(cells[2]);
        }

        [Fact]
        public void TheBufferHasOneCell_AddingTwoMoreCellsAtOnce_ThereAreThreeCells()
        {
            var textBuffer = new TextBuffer();
            textBuffer.Append(new Cell('A'));

            var cells = new[]
            {
                new Cell('B'),
                new Cell('C')
            };

            textBuffer.Append(cells);

            textBuffer[1].Should().Be(cells[0]);
            textBuffer[2].Should().Be(cells[1]);
        }

        [Fact]
        public void TheBufferHasCells_WhenClearingTheBuffer_TheBufferBecomesEmpty()
        {
            var cells = new[]
            {
                new Cell('A'),
                new Cell('B'),
                new Cell('C')
            };

            var textBuffer = new TextBuffer(cells);

            textBuffer.Clear();

            textBuffer.Length.Should().Be(0);
        }
    }
}