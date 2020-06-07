using Xunit;
using FluentAssertions;
using Terminoid;

namespace Terminoid.Tests
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
            var cell = new Cell('A', Color.FromRgb(255, 255, 0));

            cell.Foreground.Should().BeEquivalentTo(Color.FromRgb(255, 255, 0));
        }

        [Fact]
        public void WhenCreatingACell_ItIsGivenAnOptionalBackground_TheBackgroundIsRetained()
        {
            var cell = new Cell('A', Color.FromRgb(255, 255, 0), Color.FromRgb(0, 0, 64));

            cell.Background.Should().BeEquivalentTo(Color.FromRgb(0, 0, 64));
        }

        [Fact]
        public void ByDefault_ACellHasNoForeground()
        {
            var cell = new Cell('A');

            cell.Foreground.IsEmpty.Should().BeTrue();
        }

        [Fact]
        public void ByDefault_ACellHasNoBackground()
        {
            var cell = new Cell('A');

            cell.Background.IsEmpty.Should().BeTrue();
        }
    }
}