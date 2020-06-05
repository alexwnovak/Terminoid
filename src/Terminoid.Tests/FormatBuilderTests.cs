using System;
using Xunit;
using FluentAssertions;
using Terminoid;

namespace Terminoid.Tests
{
    public class FormatBuilderTests
    {
        [Fact]
        public void GivenTheBuilderIsEmpty_WhenAppendingPlainText_ThenTheOutputIsJustPlainText()
        {
            var formatBuilder = new FormatBuilder();
            formatBuilder.Append("Plaintext");

            formatBuilder.ToString().Should().Be("Plaintext");
        }
    }
}