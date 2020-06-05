using System;
using Xunit;
using FluentAssertions;
using Terminoid;

namespace Terminoid.Tests
{
    public class FormatBuilderTests
    {
        [Fact]
        public void GivenTheBuilderIsEmpty_WhenNothingHasChanged_ThenTheOutputIsAnEmptyString()
        {
            var formatBuilder = new FormatBuilder();

            formatBuilder.ToString().Should().BeEmpty();
        }

        [Fact]
        public void GivenTheBuilderIsEmpty_WhenAppendingPlainText_ThenTheOutputIsJustPlainText()
        {
            var formatBuilder = new FormatBuilder();

            formatBuilder.Append("Plaintext");

            formatBuilder.ToString().Should().Be("Plaintext");
        }

        [Theory]
        [InlineData(ConsoleColor.Black, 30)]
        [InlineData(ConsoleColor.DarkRed, 31)]
        [InlineData(ConsoleColor.DarkGreen, 32)]
        [InlineData(ConsoleColor.DarkYellow, 33)]
        [InlineData(ConsoleColor.DarkBlue, 34)]
        [InlineData(ConsoleColor.DarkMagenta, 35)]
        [InlineData(ConsoleColor.DarkCyan, 36)]
        [InlineData(ConsoleColor.DarkGray, 37)]
        public void GivenTheBuilderIsEmpty_WhenAForegroundIsPushed_ThenTheOutputChangesTheForeground(ConsoleColor color, int expected)
        {
            var formatBuilder = new FormatBuilder();

            formatBuilder.PushForeground(color);

            formatBuilder.ToString().Should().Be($"\x1B[{expected}m");
        }

        [Theory]
        [InlineData(ConsoleColor.DarkGray, 30)]
        public void GivenTheBuilderIsEmpty_WhenABrightForegroundIsPushed_ThenTheOutputChangesTheForeground(ConsoleColor brightColor, int expected)
        {
            var formatBuilder = new FormatBuilder();

            formatBuilder.PushForeground(brightColor);

            formatBuilder.ToString().Should().Be($"\x1B[1;{expected}m");
        }

        [Fact]
        public void GivenTheBuilderHasAForeground_WhenPoppingTheForeground_ThenTheForegroundIsReverted()
        {
            var formatBuilder = new FormatBuilder();

            formatBuilder.PushForeground(ConsoleColor.Red);
            formatBuilder.PopForeground();

            formatBuilder.ToString().Should().EndWith("\x1B[39m");
        }

        [Fact]
        public void GivenTheBuilderHasNoForegroundSet_WhenPoppingTheForeground_ThenNoReversionOccurs()
        {
            var formatBuilder = new FormatBuilder();

            formatBuilder.PopForeground();

            formatBuilder.ToString().Should().BeEmpty();
        }
    }
}