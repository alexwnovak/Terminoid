namespace Terminoid.Core
{
   public class RegionContext
   {
      private readonly Region _region;

      public RegionContext( Region region ) => _region = region;

      public void Fill( char c, Color foreground, Color background )
      {
         _region.HasChar = true;
         _region.HasAttr = true;

         for ( int y = 0; y < _region.Height; y++ )
         {
            for ( int x = 0; x < _region.Width; x++ )
            {
               _region.Cells[y, x].Char = c;
               _region.Cells[y, x].Foreground = foreground;
               _region.Cells[y, x].Background = background;
            }
         }
      }

      public void Fill( Color foreground, Color background )
      {
         _region.HasAttr = true;

         for ( int y = 0; y < _region.Height; y++ )
         {
            for ( int x = 0; x < _region.Width; x++ )
            {
               _region.Cells[y, x].Foreground = foreground;
               _region.Cells[y, x].Background = background;
            }
         }
      }

      public void FillForeground( Color foreground )
      {
         _region.HasAttr = true;

         for ( int y = 0; y < _region.Height; y++ )
         {
            for ( int x = 0; x < _region.Width; x++ )
            {
               _region.Cells[y, x].Foreground = foreground;
            }
         }
      }

      public void Set( int x, int y, char c, Color foreground, Color background )
      {
         _region.HasChar = true;
         _region.HasAttr = true;

         _region.Cells[y, x] = new Cell( c, foreground, background );
      }

      public void SetLine( int y, string text )
      {
         _region.HasChar = true;

         for ( int x = 0; x < text.Length; x++ )
         {
            _region.Cells[y, x].Char = text[x];
         }
      }
   }
}
