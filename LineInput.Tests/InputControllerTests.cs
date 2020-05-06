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
    }
}
