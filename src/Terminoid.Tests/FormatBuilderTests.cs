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
        public void GivenTheBuilderHasSomeColorState_WhenResettingAllFormatting_ThenAllFormattingIsCleared()
        {
            var formatBuilder = new FormatBuilder();

            formatBuilder.PushForeground(Color.FromRgb(20, 40, 60));
            formatBuilder.ResetAllFormatting();

            formatBuilder.ToString().Should().EndWith("\x1B[0m");
        }
    }
}