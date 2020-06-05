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

        [Fact]
        public void GivenTheBuilderIsEmpty_WhenAForegroundIsPushed_ThenTheOutputChangesTheForeground()
        {
            var formatBuilder = new FormatBuilder();

            formatBuilder.PushForeground(ConsoleColor.Red);

            formatBuilder.ToString().Should().Be("\x1B[31m");
        }

        [Fact]
        public void GivenTheBuilderHasAForeground_WhenPoppingTheForeground_ThenTheForegroundIsReverted()
        {
            var formatBuilder = new FormatBuilder();

            formatBuilder.PushForeground(ConsoleColor.Red);
            formatBuilder.PopForeground();

            formatBuilder.ToString().Should().EndWith("\x1B[39m");
        }
    }
}