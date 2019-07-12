using System;

namespace Terminoid
{
   public static class InputHandler
   {
      public static string Read()
      {
         string input = "";
         Console.ForegroundColor = ConsoleColor.Blue;

         while ( true )
         {
            var key = Console.ReadKey( true );

            if ( key.Key == ConsoleKey.Enter )
            {
               return input;
            }

            input += key.KeyChar;
            Console.Write( key.KeyChar );
         }
      }
   }
}
