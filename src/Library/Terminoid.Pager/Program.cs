using System;
using System.IO;
using Highlight;

namespace Terminoid.Pager
{
   internal static class Program
   {
      private static int Main( string[] args )
      {
         if ( args.Length == 0 || !File.Exists( args[0] ) )
         {
            return 1;
         }

         var highlighter = new Highlighter( new VTEngine() );

         using ( var streamReader = new StreamReader(args[0] ) )
         {
            while ( !streamReader.EndOfStream )
            {
               string line = streamReader.ReadLine();
               string highlightedCode = highlighter.Highlight( "C#", line );
               Console.WriteLine( highlightedCode );
            }
         }

         return 0;
      }
   }
}
