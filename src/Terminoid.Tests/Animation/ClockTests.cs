using System;
using Xunit;
using FluentAssertions;
using LineInput.Animation;
using LineInput.Tests.Internal;

namespace LineInput.Tests.Animation
{
    public class ClockTests
    {
        [Fact]
        public void ByDefault_WithoutModification_TheElapsedTimeIsZero()
        {
            var clock = new Clock();

            clock.ElapsedTime.Should().Be(TimeSpan.Zero);
        }

        [Fact]
        public void WithNoTime_OneSecondIsAdded_TheElapsedTimeBecomesOneSecond()
        {
            var clock = new Clock();

            clock.AddTime(TimeSpan.FromSeconds(1));

            clock.ElapsedTime.TotalSeconds.Should().Be(1);
        }

        [Fact]
        public void WithOneSecondOnTheClock_AnotherSecondIsAdded_TheElapsedTimeBecomesTwoSeconds()
        {
            var clock = new Clock();

            clock.AddTime(TimeSpan.FromSeconds(1));
            clock.AddTime(TimeSpan.FromSeconds(1));

            clock.ElapsedTime.TotalSeconds.Should().Be(2);
        }

        [Fact]
        public void WithNoTime_OneSecondIsAdded_TheClockIsNotifiedOfTheNewOneSecond()
        {
            var clock = new ClockDouble();

            clock.AddTime(TimeSpan.FromSeconds(1));

            clock.AddedTime.TotalSeconds.Should().Be(1);
        }
    }
}