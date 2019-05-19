using System;
using FluentAssertions;
using Xunit;

namespace Terminoid.Tests
{
   public class MenuTests
   {
      [Fact]
      public void Constructor_ItemsAreNull_ThrowsArgumentNullException()
      {
         Action constructor = () => new Menu( null );

         constructor.Should().Throw<ArgumentNullException>();
      }
   }
}
