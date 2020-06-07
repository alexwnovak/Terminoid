using System;
using Xunit;
using FluentAssertions;
using Terminoid;

namespace Terminoid.Tests
{
    public class FormatBuilderBackgroundColorTests
    {
        [Fact]
        public void GivenAConsoleColorBackgroundWasPushed_WhenPoppingTheBackground_ThenTheBackgroundIsReverted()
        {
            var formatBuilder = new FormatBuilder();

            formatBuilder.PushBackground(ConsoleColor.Red);
            formatBuilder.PopBackground();

            formatBuilder.ToString().Should().EndWith("\x1B[49m");
        }

        [Fact]
        public void GivenAnRgbBackgroundColorWasPushed_WhenPoppingTheBackground_ThenTheBackgroundIsReverted()
        {
            var formatBuilder = new FormatBuilder();

            formatBuilder.PushBackground(Color.FromRgb(20, 40, 60));
            formatBuilder.PopBackground();

            formatBuilder.ToString().Should().EndWith("\x1B[49m");
        }
    }
}