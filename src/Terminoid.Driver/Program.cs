using System;

namespace Terminoid.Driver
{
   class Program
   {
      static void Main( string[] args )
      {
         var items = new[]
         {
            "first",
            "second",
            "third",
            "fourth",
            "fifth",
            "sixth",
            "seventh",
            "eighth",
            "ninth",
            "tenth",
            "eleventh",
            "twelfth",
            "thirteenth",
            "fourteenth",
            "fifteenth"
         };

         var menu = new Menu( items );
         int index = menu.Show( 10, 10 );

         if ( index == -1 )
         {
            Console.WriteLine( "Cancelled" );
         }
         else
         {
            Console.WriteLine( $"Got {items[index]}" );
         }

         Console.Read();
      }
   }
}
