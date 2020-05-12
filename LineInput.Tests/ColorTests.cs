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

        [Fact]
        public void TwoDifferentColorsExistButHaveSameValues_ComparingForEquality_ColorsAreEqual()
        {
            var one = new Color(1, 2, 3);
            var two = new Color(1, 2, 3);

            one.Equals(two).Should().Be(true);
        }

        [Fact]
        public void TwoDifferentColorsExistButHaveSameValues_ComparingForEqualityUsingOperator_ColorsAreEqual()
        {
            var one = new Color(1, 2, 3);
            var two = new Color(1, 2, 3);

            (one == two).Should().Be(true);
        }

        [Fact]
        public void TwoDifferentColorsExistAndHaveDifferentValues_ComparingForEquality_ColorsAreNotEqual()
        {
            var one = new Color(1, 2, 3);
            var two = new Color(7, 8, 9);

            one.Equals(two).Should().Be(false);
        }

        [Fact]
        public void TwoDifferentColorsExistButHaveDifferentValues_ComparingForEqualityUsingOperator_ColorsAreNotEqual()
        {
            var one = new Color(1, 2, 3);
            var two = new Color(7, 8, 9);

            (one != two).Should().Be(true);
        }
    }
}