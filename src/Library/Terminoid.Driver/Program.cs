using System;
using Terminoid.Core;

namespace Terminoid.Driver
{
   class Program
   {
      private const string _background = @"Bacon ipsum dolor amet pork loin swine bresaola boudin chuck turkey turducken filet mignon spare ribs frankfurter pork belly. Leberkas andouille fatback drumstick jerky pork belly flank swine doner ball tip filet mignon. Bacon chicken pig jerky, landjaeger shankle tongue. Hamburger shank pork belly, cupim swine jerky tail brisket. Sirloin spare ribs sausage, beef ribs tongue cupim beef ham hock leberkas. Sirloin buffalo pork chop picanha filet mignon, kevin andouille short ribs pork belly pastrami hamburger bacon. Sirloin kielbasa chuck fatback bacon venison. Fatback pancetta kevin, kielbasa landjaeger strip steak turkey short ribs. Pig landjaeger shankle burgdoggen, shoulder bresaola salami drumstick pork chop corned beef. Rump andouille doner, tongue tail pork belly bresaola sirloin. Beef ribs tri-tip shoulder strip steak. Sirloin boudin burgdoggen pork belly. Turducken short loin corned beef, swine beef ribs kevin venison. Prosciutto flank ground round meatloaf chuck tongue shank alcatra salami filet mignon ribeye sausage. Porchetta ribeye meatloaf leberkas. Biltong swine cow bacon turducken leberkas. Jowl pig beef ribs venison, pork chop tongue drumstick turkey biltong bresaola. Brisket tail capicola jowl salami andouille. Jowl tail cow corned beef. Capicola jowl kevin, meatloaf burgdoggen turkey pork chop biltong jerky andouille strip steak beef corned beef ham. Burgdoggen ground round pig beef ribs.";

      private static void TestMenu()
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

         Console.WriteLine( _background );

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
      }

      private static void TestNewRegion()
      {
         Console.WriteLine( _background );

         int x = Viewport.Left + 2;
         int y = Viewport.Top + 2;

         var under = ConsoleContext.Read( x, y, 20, 10 );

         var region = new Region( 20, 10 );

         var regionContext = new RegionContext( region );
         //regionContext.FillColor( Color.White, Color.DarkBlue );

         regionContext.Set( 0, 0, 'x', Color.White, Color.DarkBlue );
         regionContext.Set( 1, 0, '!', Color.White, Color.DarkBlue );

         ConsoleContext.Write( region, x, y );

         Console.Read();
         ConsoleContext.Write( under, x, y );
         Console.Read();
      }

      static void Main( string[] args )
      {
         //TestMenu();
         TestNewRegion();
         Console.Read();
      }
   }
}
