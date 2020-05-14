using Xunit;
using FluentAssertions;
using LineInput;

namespace LineInput.Tests
{
    public class CellTests
    {
        [Fact]
        public void ByDefault_CellsHaveDefaultGrayForeground()
        {
            var cell = new Cell('A');

            cell.Foreground.Should().BeEquivalentTo(new Color(127, 127, 127));
        }

    }
}