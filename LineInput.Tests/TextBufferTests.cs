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
        public void GivenTheTextBufferWasCreated_WhenNoInitialDataIsGiven_TheBlankCellExists()
        {
            var textBuffer = new TextBuffer();

            textBuffer[0].Char.Should().Be(' ');
        }

        [Fact]
        public void GivenNoInitialData_WhenReadingAnIndexThatDoesNotExist_ThenItThrowsArgumentOutOfRangeException()
        {
            var textBuffer = new TextBuffer();

            Action indexer = () => Trace.WriteLine(textBuffer[textBuffer.Length + 1]);

            indexer.Should().Throw<ArgumentOutOfRangeException>();
        }

        [Fact]
        public void GivenTextBufferWasCreated_WhenPassingCellsDuringCreation_ThenTheCellsAreAdded()
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
        public void GivenTextBufferWasCreated_WhenPassingCellsDuringCreation_ThenTheBlankCellIsMovedToTheEnd()
        {
            var cells = new[]
            {
                new Cell('A'),
                new Cell('B'),
                new Cell('C')
            };

            var textBuffer = new TextBuffer(cells);

            textBuffer[3].Char.Should().Be(' ');
        }

        [Fact]
        public void GivenNoCellsHaveBeenAdded_WhenAppendingACell_ThenTheNewCellCanBeReadByIndexerAndIsTheSameInstance()
        {
            var textBuffer = new TextBuffer();

            var cell = new Cell('A');
            textBuffer.Append(cell);

            textBuffer[0].Should().Be(cell);
        }

        [Fact]
        public void GivenNoCellsHaveBeenAdded_WhenAppendingACell_ThenTheBlankCellMovesToTheEnd()
        {
            var textBuffer = new TextBuffer();

            var cell = new Cell('A');
            textBuffer.Append(cell);

            textBuffer[0].Should().Be(cell);
        }

        [Fact]
        public void GivenNoCellsHasBeenAdded_WhenAddingThreeCells_ThenTheThreeCellsAreAdded()
        {
            var newCells = new[]
            {
                new Cell('A'),
                new Cell('B'),
                new Cell('C'),
            };

            var textBuffer = new TextBuffer();

            textBuffer.Append(newCells);

            textBuffer[0].Should().Be(newCells[0]);
            textBuffer[1].Should().Be(newCells[1]);
            textBuffer[2].Should().Be(newCells[2]);
        }

        [Fact]
        public void GivenNoCellsHasBeenAdded_WhenAddingThreeCells_ThenTheBlankCellIsMovedToTheEnd()
        {
            var newCells = new[]
            {
                new Cell('A'),
                new Cell('B'),
                new Cell('C'),
            };

            var textBuffer = new TextBuffer();

            textBuffer.Append(newCells);

            textBuffer[3].Char.Should().Be(' ');
        }

        [Fact]
        public void GivenNoCellsHasBeenAdded_WhenAddingThreeCharactersAsAString_ThenTheCharactersAreAddedAsCells()
        {
            var textBuffer = new TextBuffer();

            textBuffer.Append("ABC");

            textBuffer[0].Char.Should().Be('A');
            textBuffer[1].Char.Should().Be('B');
            textBuffer[2].Char.Should().Be('C');
        }

        [Fact]
        public void GivenNoCellsHasBeenAdded_WhenAddingThreeCharactersAsAString_ThenTheBlankCellIsMovedToTheEnd()
        {
            var textBuffer = new TextBuffer();

            textBuffer.Append("ABC");

            textBuffer[0].Char.Should().Be('A');
            textBuffer[1].Char.Should().Be('B');
            textBuffer[2].Char.Should().Be('C');

            textBuffer[3].Char.Should().Be(' ');
        }

        [Fact]
        public void GivenThereIsOneCell_WhenAddingTwoMoreCellsAtOnce_ThenThereAreThreeCells()
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
        public void GivenThereIsOneCell_WhenInsertingACellAtTheStart_ThenTheNewCellIsNowTheFirstCell()
        {
            var textBuffer = new TextBuffer();
            textBuffer.Append(new Cell('B'));

            var newCell = new Cell('A');
            textBuffer.Insert(0, newCell);

            textBuffer[0].Should().Be(newCell);
        }

        [Fact]
        public void GivenThereIsOneCell_WhenInsertingACellAtTheStart_ThenTheBlankCellIsStillAtTheEnd()
        {
            var textBuffer = new TextBuffer();
            textBuffer.Append(new Cell('B'));

            var newCell = new Cell('A');
            textBuffer.Insert(0, newCell);

            textBuffer[2].Char.Should().Be(' ');
        }

        // [Fact]
        // public void TheBufferHasOneCell_InsertingACellIntoAnIndexThatDoesNotExist_ThrowsArgumentOutOfRangeException()
        // {
        //     var textBuffer = new TextBuffer();
        //     textBuffer.Append(new Cell('B'));

        //     var newCell = new Cell('A');
        //     Action insert = () => textBuffer.Insert(textBuffer.Length + 1, newCell);

        //     insert.Should().Throw<ArgumentOutOfRangeException>();
        // }

        // [Fact]
        // public void TheBufferHasOneCell_InsertingASingleCharacterAtTheStart_TheCharacterIsNowACellAtTheStart()
        // {
        //     var textBuffer = new TextBuffer();
        //     textBuffer.Append(new Cell('B'));

        //     textBuffer.Insert(0, 'A');

        //     textBuffer[0].Char.Should().Be('A');
        // }

        // [Fact]
        // public void TheBufferHasOneCell_InsertingACharacterIntoAnIndexThatDoesNotExist_ThrowsArgumentOutOfRangeException()
        // {
        //     var textBuffer = new TextBuffer();
        //     textBuffer.Append(new Cell('B'));

        //     var newCell = new Cell('A');
        //     Action insert = () => textBuffer.Insert(textBuffer.Length + 1, 'A');

        //     insert.Should().Throw<ArgumentOutOfRangeException>();
        // }

        // [Fact]
        // public void TheBufferHasOneCell_InsertingAStringOfTextAtTheStart_TheStringBecomesCellsAtTheStart()
        // {
        //     var textBuffer = new TextBuffer();
        //     textBuffer.Append(new Cell('C'));

        //     textBuffer.Insert(0, "AB");

        //     textBuffer[0].Char.Should().Be('A');
        //     textBuffer[1].Char.Should().Be('B');
        // }

        // [Fact]
        // public void TheBufferHasOneCell_InsertingAStringOfTextIntoAnIndexThatDoesNotExist_ThrowsArgumentOutOfRangeException()
        // {
        //     var textBuffer = new TextBuffer();
        //     textBuffer.Append(new Cell('B'));

        //     var newCell = new Cell('A');
        //     Action insert = () => textBuffer.Insert(textBuffer.Length + 1, "AA");

        //     insert.Should().Throw<ArgumentOutOfRangeException>();
        // }

        // [Fact]
        // public void TheBufferHasOneCell_RemovingTheCellByItsIndex_TheBufferBecomesEmpty()
        // {
        //     var textBuffer = new TextBuffer();
        //     textBuffer.Append(new Cell('A'));

        //     textBuffer.Remove(0);

        //     textBuffer.Length.Should().Be(0);
        // }

        // [Fact]
        // public void TheBufferHasOneCell_RemovingAnIndexThatDoesNotExist_ThrowsArgumentOutOfRangeException()
        // {
        //     var textBuffer = new TextBuffer();
        //     textBuffer.Append(new Cell('A'));

        //     Action remove = () => textBuffer.Remove(textBuffer.Length + 1);

        //     remove.Should().Throw<ArgumentOutOfRangeException>();
        // }

        // [Fact]
        // public void TheBufferHasCells_WhenClearingTheBuffer_TheBufferBecomesEmpty()
        // {
        //     var cells = new[]
        //     {
        //         new Cell('A'),
        //         new Cell('B'),
        //         new Cell('C')
        //     };

        //     var textBuffer = new TextBuffer(cells);

        //     textBuffer.Clear();

        //     textBuffer.Length.Should().Be(0);
        // }

        // [Fact]
        // public void TheBufferHasCells_ConvertingToAString_GivesTheRawText()
        // {
        //     var cells = new[]
        //     {
        //         new Cell('A'),
        //         new Cell('B'),
        //         new Cell('C')
        //     };

        //     var textBuffer = new TextBuffer(cells);

        //     textBuffer.ToString().Should().Be("ABC");
        // }
    }
}