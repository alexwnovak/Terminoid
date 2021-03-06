using Xunit;
using FluentAssertions;
using Terminoid;

namespace Terminoid.Tests
{
    public class ColorTests
    {
        [Fact]
        public void CreatingAColor_PassesColorComponents_ComponentsAreRetained()
        {
            var color = Color.FromRgb(1, 2, 3);

            color.R.Should().Be(1);
            color.G.Should().Be(2);
            color.B.Should().Be(3);
        }

        [Fact]
        public void TwoDifferentColorsExistButHaveSameValues_ComparingForEquality_ColorsAreEqual()
        {
            var one = Color.FromRgb(1, 2, 3);
            var two = Color.FromRgb(1, 2, 3);

            one.Equals(two).Should().Be(true);
        }

        [Fact]
        public void TwoDifferentColorsExistButHaveSameValues_ComparingForEqualityUsingOperator_ColorsAreEqual()
        {
            var one = Color.FromRgb(1, 2, 3);
            var two = Color.FromRgb(1, 2, 3);

            (one == two).Should().Be(true);
        }

        [Fact]
        public void TwoDifferentColorsExistAndHaveDifferentValues_ComparingForEquality_ColorsAreNotEqual()
        {
            var one = Color.FromRgb(1, 2, 3);
            var two = Color.FromRgb(7, 8, 9);

            one.Equals(two).Should().Be(false);
        }

        [Fact]
        public void TwoDifferentColorsExistButHaveDifferentValues_ComparingForEqualityUsingOperator_ColorsAreNotEqual()
        {
            var one = Color.FromRgb(1, 2, 3);
            var two = Color.FromRgb(7, 8, 9);

            (one != two).Should().Be(true);
        }

        [Fact]
        public void ThereAreTwoColors_TheColorsAreAddedTogether_AThirdColorIsProducedAsTheSumOfTheTwo()
        {
            var one = Color.FromRgb(1, 2, 3);
            var two = Color.FromRgb(7, 8, 9);

            var three = one + two;

            three.R.Should().Be(8);
            three.G.Should().Be(10);
            three.B.Should().Be(12);
        }

        [Fact]
        public void ThereAreTwoColorsWhoseValuesSumOverTheMax_AddingColors_ComponentsAreCappedAtTheMaxValue()
        {
            var one = Color.FromRgb(200, 200, 200);
            var two = Color.FromRgb(200, 200, 200);

            var three = one + two;

            three.R.Should().Be(255);
            three.G.Should().Be(255);
            three.B.Should().Be(255);
        }

        [Fact]
        public void ThereAreTwoColorsWhoseValuesDifferBelowTheMax_SubtractingColors_ComponentsAreCappedAtTheMinValue()
        {
            var one = Color.FromRgb(100, 100, 100);
            var two = Color.FromRgb(200, 200, 200);

            var three = one - two;

            three.R.Should().Be(0);
            three.G.Should().Be(0);
            three.B.Should().Be(0);
        }

        [Fact]
        public void OneColorExists_AddingJustToTheRedComponent_ANewColorIsProducedWithTheNewRedAndOldGreenAndBlue()
        {
            var color = Color.FromRgb(10, 20, 30);

            var newColor = color + Color.Red(100);

            newColor.R.Should().Be(110);
            newColor.G.Should().Be(20);
            newColor.B.Should().Be(30);
        }

        [Fact]
        public void OneColorExists_AddingEnoughToOverflowRedComponent_RedComponentIsClampedAtMaximum()
        {
            var color = Color.FromRgb(200, 20, 30);

            var newColor = color + Color.Red(200);

            newColor.R.Should().Be(255);
        }

        [Fact]
        public void OneColorExists_SubtractingEnoughToUnderflowRedComponent_RedComponentIsClampedAtMinimum()
        {
            var color = Color.FromRgb(100, 20, 30);

            var newColor = color - Color.Red(200);

            newColor.R.Should().Be(0);
        }

        [Fact]
        public void OneColorExists_AddingJustToTheGreenComponent_ANewColorIsProducedWithTheNewGreenAndOldRedAndBlue()
        {
            var color = Color.FromRgb(10, 20, 30);

            var newColor = color + Color.Green(100);

            newColor.R.Should().Be(10);
            newColor.G.Should().Be(120);
            newColor.B.Should().Be(30);
        }

        [Fact]
        public void OneColorExists_AddingEnoughToOverflowGreenComponent_GreenComponentIsClampedAtMaximum()
        {
            var color = Color.FromRgb(10, 200, 30);

            var newColor = color + Color.Green(200);

            newColor.G.Should().Be(255);
        }

        [Fact]
        public void OneColorExists_SubtractingEnoughToUnderflowGreenComponent_GreenComponentIsClampedAtMinimum()
        {
            var color = Color.FromRgb(10, 20, 30);

            var newColor = color - Color.Green(200);

            newColor.G.Should().Be(0);
        }

        [Fact]
        public void OneColorExists_AddingJustToTheBlueComponent_ANewColorIsProducedWithTheNewBlueAndOldRedAndGreen()
        {
            var color = Color.FromRgb(10, 20, 30);

            var newColor = color + Color.Blue(100);

            newColor.R.Should().Be(10);
            newColor.G.Should().Be(20);
            newColor.B.Should().Be(130);
        }

        [Fact]
        public void OneColorExists_AddingEnoughToOverflowBlueComponent_BlueComponentIsClampedAtMaximum()
        {
            var color = Color.FromRgb(10, 20, 30);

            var newColor = color + Color.Blue(240);

            newColor.B.Should().Be(255);
        }

        [Fact]
        public void OneColorExists_SubtractingEnoughToUnderflowBlueComponent_BlueComponentIsClampedAtMinimum()
        {
            var color = Color.FromRgb(10, 20, 30);

            var newColor = color - Color.Blue(200);

            newColor.B.Should().Be(0);
        }

        [Fact]
        public void OneColorExists_ChainingAdditionsTogetherForAllComponents_TheNewColorHasTheRightValues()
        {
            var color = Color.FromRgb(10, 20, 30);

            var newColor = color + Color.Red(1) + Color.Green(2) + Color.Blue(3);

            newColor.R.Should().Be(11);
            newColor.G.Should().Be(22);
            newColor.B.Should().Be(33);
        }

        [Fact]
        public void GivenAnRGBColorWasCreated_WhenReadingItsEmptyProperty_ThenTheColorIsNotEmpty()
        {
            var color = Color.FromRgb(1, 2, 3);

            color.IsEmpty.Should().BeFalse();
        }

        [Fact]
        public void GivenAnEmptyColorWasCreated_WhenReadingItsProperties_ThenEmptyIsTrueAndRGBValuesAreZero()
        {
            var color = Color.Empty();

            color.IsEmpty.Should().BeTrue();
            color.R.Should().Be(0);
            color.G.Should().Be(0);
            color.B.Should().Be(0);
        }

        [Fact]
        public void GivenTwoColorsExistWithSameValuesButOneIsEmpty_WhenComparing_ThenTheyAreNotEqual()
        {
            var red = Color.FromRgb(0, 0, 0);
            var empty = Color.Empty();

            bool areEqual = red == empty;
            areEqual.Should().BeFalse();
        }

        [Fact]
        public void GivenTwoEmptyColorsExist_WhenComparing_ThenTheyAreEqual()
        {
            var emptyOne = Color.Empty();
            var emptyTwo = Color.Empty();

            bool areEqual = emptyOne == emptyTwo;
            areEqual.Should().BeTrue();
        }

        [Fact]
        public void GivenAnRgbColorExists_WhenConvertingToString_TheRgbComponentsAreReturned()
        {
            var color = Color.FromRgb(1, 2, 3);

            color.ToString().Should().Be("(1,2,3)");
        }

        [Fact]
        public void GivenAnEmptyColorExists_WhenConvertingToString_TheEmptyValueIsReturned()
        {
            var color = Color.Empty();

            color.ToString().Should().Be("(Empty)");
        }
    }
}