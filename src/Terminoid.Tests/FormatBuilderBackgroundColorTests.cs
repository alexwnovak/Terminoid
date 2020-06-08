using System;
using Xunit;
using FluentAssertions;
using Terminoid;

namespace Terminoid.Tests
{
    public class FormatBuilderBackgroundColorTests
    {
        [Theory]
        [InlineData(ConsoleColor.Black, 40)]
        [InlineData(ConsoleColor.DarkRed, 41)]
        [InlineData(ConsoleColor.DarkGreen, 42)]
        [InlineData(ConsoleColor.DarkYellow, 43)]
        [InlineData(ConsoleColor.DarkBlue, 44)]
        [InlineData(ConsoleColor.DarkMagenta, 45)]
        [InlineData(ConsoleColor.DarkCyan, 46)]
        [InlineData(ConsoleColor.Gray, 47)]
        public void GivenTheBuilderIsEmpty_WhenABackgroundIsPushed_ThenTheOutputChangesTheBackground(ConsoleColor color, int expected)
        {
            var formatBuilder = new FormatBuilder();

            formatBuilder.PushBackground(color);

            formatBuilder.ToString().Should().Be($"\x1B[{expected}m");
        }

        // [Theory]
        // [InlineData(ConsoleColor.DarkGray, 30)]
        // [InlineData(ConsoleColor.Red, 31)]
        // [InlineData(ConsoleColor.Green, 32)]
        // [InlineData(ConsoleColor.Yellow, 33)]
        // [InlineData(ConsoleColor.Blue, 34)]
        // [InlineData(ConsoleColor.Magenta, 35)]
        // [InlineData(ConsoleColor.Cyan, 36)]
        // [InlineData(ConsoleColor.White, 37)]
        // public void GivenTheBuilderIsEmpty_WhenABrightForegroundIsPushed_ThenTheOutputChangesTheForeground(ConsoleColor brightColor, int expected)
        // {
        //     var formatBuilder = new FormatBuilder();

        //     formatBuilder.PushForeground(brightColor);

        //     formatBuilder.ToString().Should().Be($"\x1B[1;{expected}m");
        // }

        [Fact]
        public void GivenTheBuilderIsEmpty_WhenAnRgbBackgroundColorIsPushed_ThenTheOutputChangesTheBackground()
        {
            var formatBuilder = new FormatBuilder();

            formatBuilder.PushBackground(Color.FromRgb(20, 40, 60));

            formatBuilder.ToString().Should().Be("\x1B[48;2;20;40;60m");
        }

        [Fact]
        public void GivenABackgroundConsoleColorWasPushed_WhenPoppingTheBackground_ThenTheForegroundIsReverted()
        {
            var formatBuilder = new FormatBuilder();

            formatBuilder.PushBackground(ConsoleColor.Red);
            formatBuilder.PopBackground();

            formatBuilder.ToString().Should().EndWith("\x1B[49m");
        }

        [Fact]
        public void GivenABackgroundRgbColorWasPushed_WhenPoppingTheBackground_ThenTheForegroundIsReverted()
        {
            var formatBuilder = new FormatBuilder();

            formatBuilder.PushBackground(Color.FromRgb(20, 40, 60));
            formatBuilder.PopBackground();

            formatBuilder.ToString().Should().EndWith("\x1B[49m");
        }

        [Fact]
        public void GivenTheBuilderHasNoBackgroundSet_WhenPoppingTheBackground_ThenNoReversionOccurs()
        {
            var formatBuilder = new FormatBuilder();

            formatBuilder.PopBackground();

            formatBuilder.ToString().Should().BeEmpty();
        }

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