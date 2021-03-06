﻿using System;
using Terminoid.Core.Internal;

namespace Terminoid.Core
{
   public static class ConsoleContext
   {
      private static IntPtr _handle = NativeMethods.GetStdHandle( NativeMethods.STD_OUTPUT_HANDLE );

      public static Region Read( int x, int y, int width, int height )
      {
         var charInfo = new CHAR_INFO[height, width];

         var rect = new SMALL_RECT
         {
            Left = (short) x,
            Top = (short) y,
            Right = (short) ( x + width - 1 ),
            Bottom = (short) ( y + height - 1 )
         };

         NativeMethods.ReadConsoleOutput(
            _handle,
            charInfo,
            new COORD( (short) width, (short) height ),
            new COORD( 0, 0 ),
            ref rect );

         var region = new Region( width, height );
         var regionContext = new RegionContext( region );

         for ( int row = 0; row < height; row++ )
         {
            for ( int column = 0; column < width; column++ )
            {
               char c = charInfo[row, column].UnicodeChar;

               var foreground = ColorMask.GetForeground( charInfo[row, column].Attributes );
               var background = ColorMask.GetBackground( charInfo[row, column].Attributes );

               regionContext.Set( column, row, c, foreground, background );
            }
         }

         return region;
      }

      public static void Write( Region region, int x, int y )
      {
         if ( region.HasChar && region.HasAttr )
         {
            WriteFullRegion( region, x, y );
         }
         else if ( region.HasAttr )
         {
            WriteAttrRegion( region, x, y );
         }
         else if ( region.HasChar )
         {
            WriteCharRegion( region, x, y );
         }
      }

      private static void WriteFullRegion( Region region, int x, int y )
      {
         var charInfo = new CHAR_INFO[region.Height, region.Width];

         for ( int row = 0; row < region.Height; row++ )
         {
            for ( int column = 0; column < region.Width; column++ )
            {
               var cell = region.Cells[row, column];

               charInfo[row, column] = new CHAR_INFO
               {
                  UnicodeChar = cell.Char,
                  Attributes = ColorMask.GetAttribute( cell.Foreground, cell.Background )
               };
            }
         }

         var rect = new SMALL_RECT
         {
            Left = (short) x,
            Top = (short) y,
            Right = (short) ( x + region.Width - 1 ),
            Bottom = (short) ( y + region.Height - 1 )
         };

         NativeMethods.WriteConsoleOutput(
            _handle,
            charInfo,
            new COORD( (short) region.Width, (short) region.Height ),
            new COORD( 0, 0 ),
            ref rect );
      }

      private static void WriteAttrRegion( Region region, int x, int y )
      {
         var attr = new ushort[region.Width];

         for ( int row = 0; row < region.Height; row++ )
         {
            for ( int column = 0; column < region.Width; column++ )
            {
               var cell = region.Cells[row, column];
               attr[column] = ColorMask.GetAttribute( cell.Foreground, cell.Background );
            }

            NativeMethods.WriteConsoleOutputAttribute(
               _handle,
               attr,
               (uint) attr.Length,
               new COORD( (short) x, (short) (y + row) ),
               out _ );
         }
      }

      private static void WriteCharRegion( Region region, int x, int y )
      {
         var chars = new char[region.Width];

         for ( int row = 0; row < region.Height; row++ )
         {
            for ( int column = 0; column < region.Width; column++ )
            {
               var cell = region.Cells[row, column];
               chars[column] = cell.Char;
            }

            NativeMethods.WriteConsoleOutputCharacter(
               _handle,
               chars,
               (uint) chars.Length,
               new COORD( (short) x, (short) ( y + row ) ),
               out _ );
         }
      }
   }
}
