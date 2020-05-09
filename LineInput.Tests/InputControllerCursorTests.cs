using System;
using Xunit;
using FluentAssertions;
using LineInput.Tests.Internal;

namespace LineInput.Tests
{
    public partial class InputControllerTests
    {
        [Fact]
        public void CursorIndex_ByDefault_IsAtLocation0()
        {
            var sut = new InputController();

            sut.CursorIndex.Should().Be(0);
        }

        [Fact]
        public void TheLineIsBlank_UserPressesLeftArrow_CursorIndexDoesNotChange()
        {
            var sut = new InputController();

            sut.PressKey(KeyFactory.FromKey(ConsoleKey.LeftArrow));

            sut.CursorIndex.Should().Be(0);
        }

        [Fact]
        public void TheLineIsBlank_UserPressesRightArrow_CursorIndexDoesNotChange()
        {
            var sut = new InputController();

            sut.PressKey(KeyFactory.FromKey(ConsoleKey.RightArrow));

            sut.CursorIndex.Should().Be(0);
        }

        [Fact]
        public void CursorIsAtTheEndOfTheLine_UserPressesLeftArrow_CursorIndexMovesLeftOneCharacter()
        {
            var sut = new InputController();

            sut.PressKey(KeyFactory.FromChar('a', ConsoleKey.A));
            sut.PressKey(KeyFactory.FromKey(ConsoleKey.LeftArrow));

            sut.CursorIndex.Should().Be(0);
        }

        [Fact]
        public void CursorIsAtTheEndOfTheLine_UserPressesRightArrow_CursorIndexDoesNotChange()
        {
            var sut = new InputController();

            sut.PressKey(KeyFactory.FromChar('a', ConsoleKey.A));
            sut.PressKey(KeyFactory.FromKey(ConsoleKey.RightArrow));

            sut.CursorIndex.Should().Be(1);
        }

        [Fact]
        public void CursorIsInTheMiddle_UserPressesRightArrow_CursorIndexMovesRightOneCharacter()
        {
            var sut = new InputController();

            sut.PressKey(KeyFactory.FromChar('a', ConsoleKey.A));
            sut.PressKey(KeyFactory.FromKey(ConsoleKey.LeftArrow));
            sut.PressKey(KeyFactory.FromKey(ConsoleKey.RightArrow));

            sut.CursorIndex.Should().Be(1);
        }

        [Fact]
        public void CursorIndex_PressingAKey_CursorMovesWithCharacterInsertion()
        {
            var sut = new InputController();

            sut.PressKey(KeyFactory.FromChar('a', ConsoleKey.A));

            sut.CursorIndex.Should().Be(1);
        }
    }
}