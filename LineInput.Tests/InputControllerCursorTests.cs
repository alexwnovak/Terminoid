using System;
using Xunit;
using FluentAssertions;

namespace LineInput.Tests
{
    public class InputControllerCursorTests
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
    }
}