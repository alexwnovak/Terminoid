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
        public void WhenCreatingACell_ItIsGivenAnOptionalForeground_TheForegroundIsRetained()
        {
            var cell = new Cell('A', new Color(255, 255, 0));

            cell.Foreground.Should().BeEquivalentTo(new Color(255, 255, 0));
        }

        [Fact]
        public void WhenCreatingACell_ItIsGivenAnOptionalBackground_TheBackgroundIsRetained()
        {
            var cell = new Cell('A', new Color(255, 255, 0), new Color(0, 0, 64));

            cell.Background.Should().BeEquivalentTo(new Color(0, 0, 64));
        }

        [Fact]
        public void ByDefault_CellsHaveDefaultGrayForeground()
        {
            var cell = new Cell('A');

            cell.Foreground.Should().BeEquivalentTo(new Color(127, 127, 127));
        }

        [Fact]
        public void ByDefault_ACellHasNoBackground()
        {
            var cell = new Cell('A');

            cell.Background.Should().BeNull();
        }
    }
}