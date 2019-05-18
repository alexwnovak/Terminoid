using System;

namespace Terminoid.Native
{
   public static class ConsoleContext
   {
      private static IntPtr _handle = NativeMethods.GetStdHandle( NativeMethods.STD_OUTPUT_HANDLE );

      public unsafe static void WriteChars( int x, int y, ReadOnlySpan<char> slice, ReadOnlySpan<ushort> attr )
      {
         fixed ( char* ptr = slice )
         {
            NativeMethods.WriteConsoleOutputCharacter(
               _handle,
               ptr,
               (uint) slice.Length,
               new COORD( (short) x, (short) y ),
               out _ );
         }

         fixed ( ushort* ptr = attr )
         {
            NativeMethods.WriteConsoleOutputAttribute(
               _handle,
               ptr,
               (uint) attr.Length,
               new COORD( (short) x, (short) y ),
               out _ );
         }
      }

      public static char[] ReadChars( int x, int y, int length )
      {
         var buffer = new char[length];

         NativeMethods.ReadConsoleOutputCharacter(
            _handle,
            buffer,
            (uint) length,
            new COORD( (short) x, (short) y ),
            out _ );

         return buffer;
      }

      public static ushort[] ReadAttrs( int x, int y, int length )
      {
         var attrs = new ushort[length];

         NativeMethods.ReadConsoleOutputAttribute(
            _handle,
            attrs,
            (uint) length,
            new COORD( (short) x, (short) y ),
            out _ );

         return attrs;
      }
   }
}
