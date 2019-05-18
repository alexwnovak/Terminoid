using System;
using Terminoid.Native;

namespace Terminoid
{
   public static class RegionRenderer
   {
      public static Region Read( int x, int y, int width, int height )
      {
         var region = new Region( width, height );

         for ( int row = 0; row < height; row++ )
         {
            var charBuffer = ConsoleContext.ReadChars( x, y + row, width );
            region.SetCharLine( row, charBuffer );

            var attrBuffer = ConsoleContext.ReadAttrs( x, y + row, width );
            region.SetAttrLine( row, attrBuffer );
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

            ConsoleContext.WriteChars( x, y + row, charRow, attrRow );
         }
      }
   }
}
