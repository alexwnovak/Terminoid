using System;

namespace Terminoid.Core
{
   public class RegionContext
   {
      private readonly Region _region;
      private readonly char[] _charBuffer;
      private readonly ushort[] _attrBuffer;

      public RegionContext( Region region )
      {
         _region = region;
         _charBuffer = region.GetCharBuffer();
         _attrBuffer = region.GetAttrBuffer();
      }

      public void SetCharLine( int y, char[] charBuffer )
      {
         Array.Copy( charBuffer, 0, _charBuffer, y * _region.Width, _region.Width );
      }

      public void SetAttrLine( int y, ushort[] attrBuffer )
      {
         Array.Copy( attrBuffer, 0, _attrBuffer, y * _region.Width, _region.Width );
      }

      public void FloodCharLine( int y, char c )
      {
         for ( int x = 0; x < _region.Width; x++ )
         {
            SetChar( x, y, c );
         }
      }

      public void FloodAttrLine( int y, ushort attr )
      {
         for ( int x = 0; x < _region.Width; x++ )
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
         _charBuffer[y * _region.Width + x] = c;
      }

      public void SetAttr( int x, int y, ushort a )
      {
         _attrBuffer[y * _region.Width + x] = a;
      }

      public void SetChar( int offset, char c ) => _charBuffer[offset] = c;
      public void SetAttr( int offset, ushort a ) => _attrBuffer[offset] = a;

   }
}
