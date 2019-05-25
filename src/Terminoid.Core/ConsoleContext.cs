using System;
using Terminoid.Core.Internal;

namespace Terminoid.Core
{
   public static class ConsoleContext
   {
      private static IntPtr _handle = NativeMethods.GetStdHandle( NativeMethods.STD_OUTPUT_HANDLE );

      public static void Write( Region2 region, int x, int y )
      {
         var charInfo = new CHAR_INFO[region.Width, region.Height];

         for ( int row = 0; row < region.Height; row++ )
         {
            for ( int column = 0; column < region.Width; column++ )
            {
               var cell = region.Cells[column, row];

               charInfo[column, row] = new CHAR_INFO
               {
                  UnicodeChar = cell.Char,
                  Attributes = (ushort) ((cell.Background.Value << 4) | cell.Foreground.Value)
               };
            }
         }

         var rect = new SMALL_RECT
         {
            Left = (short) x,
            Top = (short) y,
            Right = (short) (x + region.Width - 1),
            Bottom = (short) (y + region.Height - 1)
         };

         NativeMethods.WriteConsoleOutput(
            _handle,
            charInfo,
            new COORD( (short) region.Width, (short) region.Height ),
            new COORD( 0, 0 ),
            ref rect );
      }

      private unsafe static void WriteChars( int x, int y, ReadOnlySpan<char> slice, ReadOnlySpan<ushort> attr )
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

      private static char[] ReadChars( int x, int y, int length )
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

      private static ushort[] ReadAttrs( int x, int y, int length )
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

      public static Region Read( int x, int y, int width, int height )
      {
         var region = new Region( width, height );
         var regionContext = new RegionContext( region );

         for ( int row = 0; row < height; row++ )
         {
            var charBuffer = ReadChars( x, y + row, width );
            regionContext.SetCharLine( row, charBuffer );

            var attrBuffer = ReadAttrs( x, y + row, width );
            regionContext.SetAttrLine( row, attrBuffer );
         }

         return region;
      }

      public static void Render( Region region, int x, int y )
      {
         var charBuffer = region.GetCharBuffer().AsSpan();
         var attrBuffer = region.GetAttrBuffer().AsSpan();

         for ( int row = 0; row < region.Height; row++ )
         {
            var charRow = charBuffer.Slice( row * region.Width, region.Width );
            var attrRow = attrBuffer.Slice( row * region.Width, region.Width );

            WriteChars( x, y + row, charRow, attrRow );
         }
      }
   }
}
