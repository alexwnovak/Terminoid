using System.Collections;
using System.Collections.Generic;
using FluentAssertions;
using Xunit;

namespace Terminoid.Tests
{
   public class ColorTests
   {
      private class ColorDataProvider : IEnumerable<object[]>
      {
         private static object[] Case( Color color, int value ) => new object[] { color, value };

         public IEnumerator<object[]> GetEnumerator()
         {
            yield return Case( Color.Transparent, -1 );
            yield return Case( Color.Black, 0 );
            yield return Case( Color.DarkBlue, 1 );
            yield return Case( Color.DarkGreen, 2 );
            yield return Case( Color.DarkCyan, 3 );
            yield return Case( Color.DarkRed, 4 );
            yield return Case( Color.DarkMagenta, 5 );
            yield return Case( Color.DarkYellow, 6 );
            yield return Case( Color.Gray, 7 );
            yield return Case( Color.DarkGray, 8 );
            yield return Case( Color.Blue, 9 );
            yield return Case( Color.Green, 10 );
            yield return Case( Color.Cyan, 11 );
            yield return Case( Color.Red, 12 );
            yield return Case( Color.Magenta, 13 );
            yield return Case( Color.Yellow, 14 );
            yield return Case( Color.White, 15 );
         }

         IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();
      }

      [Theory]
      [ClassData( typeof( ColorDataProvider ) )]
      public void Value_EveryColor_HasCorrectValue( Color color, int value )
      {
         color.Value.Should().Be( value );
      }
   }
}
