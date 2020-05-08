using System;
using Xunit;
using FluentAssertions;

namespace LineInput.Tests
{
    public class InputControllerTests
    {
        [Fact]
        public void CursorIndex_ByDefault_IsAtLocation0()
        {
            var sut = new InputController();

            sut.CursorIndex.Should().Be(0);
        }

        [Fact]
        public void CursorIndex_PressingAKey_CursorMovesWithCharacterInsertion()
        {
            var sut = new InputController();

            sut.PressKey(new ConsoleKeyInfo('a', ConsoleKey.A, false, false, false));

            sut.CursorIndex.Should().Be(1);
        }

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

        [Fact]
        public void PressKey_PressingAKeyThatWouldBeVisible_RaisesInputChangedEvent()
        {
            var sut = new InputController();

            using (var monitoredSut = sut.Monitor())
            {
                sut.PressKey(new ConsoleKeyInfo('q', ConsoleKey.Q, false, false, false));
                monitoredSut.Should().Raise(nameof(sut.InputChanged));
            }
        }
    }
}
