using Xunit;
using FluentAssertions;
using LineInput;

namespace LineInput.Tests
{
    public class ColorTests
    {
        [Fact]
        public void CreatingAColor_PassesColorComponents_ComponentsAreRetained()
        {
            var color = new Color(1, 2, 3);

            color.R.Should().Be(1);
            color.G.Should().Be(2);
            color.B.Should().Be(3);
        }
    }
}