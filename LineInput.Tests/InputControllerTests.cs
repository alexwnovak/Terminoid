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

            sut.CursorIndex.Should().Be( 0 );
        }

        [Fact]
        public void CursorIndex_PressingAKey_CursorMovesWithCharacterInsertion()
        {
            var sut = new InputController();

            sut.PressKey( 'a' );

            sut.CursorIndex.Should().Be( 1 );
        }

        [Fact]
        public void PressKey_PressingQKey_KeyIsAddedToBuffer()
        {
            var sut = new InputController();

            sut.PressKey( 'q' );

            sut.Buffer.Should().Be( "q" );
        }

        [Fact]
        public void PressKey_PressingQKeyThenUKey_UKeyIsAppended()
        {
            var sut = new InputController();

            sut.PressKey( 'q' );
            sut.PressKey( 'u' );

            sut.Buffer.Should().Be( "qu" );
        }
    }
}
