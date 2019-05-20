using System;

namespace Terminoid
{
   public class Region
   {
      private readonly char[] _charBuffer;
      private readonly ushort[] _attrBuffer;

      public int Width { get; }
      public int Height { get; }

      public Region( int width, int height )
      {
         Width = width;
         Height = height;

         _charBuffer = new char[Width * Height];
         _attrBuffer = new ushort[Width * Height];
      }

      public void SetCharLine( int y, char[] charBuffer )
      {
         Array.Copy( charBuffer, 0, _charBuffer, y * Width, Width );
      }

      public void SetAttrLine( int y, ushort[] attrBuffer )
      {
         Array.Copy( attrBuffer, 0, _attrBuffer, y * Width, Width );
      }

      public void FloodCharLine( int y, char c )
      {
         for ( int x = 0; x < Width; x++ )
         {
            SetChar( x, y, c );
         }
      }

      public void FloodAttrLine( int y, ushort attr )
      {
         for ( int x = 0; x < Width; x++ )
         {
            SetAttr( x, y, attr );
         }
      }

      public void SetLine( int y, string text )
      {
         for ( int x = 0; x < text.Length; x++ )
         {
            SetChar( x, y, text[x] );
         }
      }

      public void SetChar( int x, int y, char c )
      {
         _charBuffer[y * Width + x] = c;
      }

      public void SetAttr( int x, int y, ushort a )
      {
         _attrBuffer[y * Width + x] = a;
      }

      public void SetChar( int offset, char c ) => _charBuffer[offset] = c;
      public void SetAttr( int offset, ushort a ) => _attrBuffer[offset] = a;

      public char[] GetCharBuffer() => _charBuffer;
      public ushort[] GetAttrBuffer() => _attrBuffer;
   }
}
