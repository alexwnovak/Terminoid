using System;
using Xunit;
using FluentAssertions;

namespace Terminoid.Tests
{
    public class ConsoleKeyInfoExtensionsTests
    {
        [Fact]
        public void GivenTheKeyHasNoModifiers_WhenAskingWhetherThereAreAnyModifiers_ThenTheAnswerIsNoModifiers()
        {
            var key = new ConsoleKeyInfo('A', ConsoleKey.A, false, false, false);

            key.HasAnyModifier().Should().BeFalse();
        }
    }
}