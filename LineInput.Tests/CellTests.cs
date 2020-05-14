using Xunit;
using FluentAssertions;
using LineInput;

namespace LineInput.Tests
{
    public class CellTests
    {
        [Fact]
        public void WhenCreatingACell_ItIsGivenACharacter_TheCharacterIsRetained()
        {
            var cell = new Cell('A');

            cell.Char.Should().Be('A');
        }

        [Fact]
        public void ByDefault_CellsHaveDefaultGrayForeground()
        {
            var cell = new Cell('A');

            cell.Foreground.Should().BeEquivalentTo(new Color(127, 127, 127));
        }


    }
}