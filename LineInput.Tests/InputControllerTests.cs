using System;
using Xunit;
using FluentAssertions;

namespace LineInput.Tests
{
    public partial class InputControllerTests
    {
        [Fact]
        public void PressKey_PressingQKey_KeyIsAddedToBuffer()
        {
            var sut = new InputController();

            sut.PressKey(new ConsoleKeyInfo('q', ConsoleKey.Q, false, false, false));

            sut.GetBuffer().Should().Be("q");
        }

        [Fact]
        public void PressKey_PressingQKeyThenUKey_UKeyIsAppended()
        {
            var sut = new InputController();

            sut.PressKey(new ConsoleKeyInfo('q', ConsoleKey.Q, false, false, false));
            sut.PressKey(new ConsoleKeyInfo('u', ConsoleKey.U, false, false, false));

            sut.GetBuffer().Should().Be("qu");
        }
    }
}
