namespace Terminoid.Core
{
   public class RegionContext
   {
      private readonly Region _region;

      public RegionContext( Region region ) => _region = region;

      public void Fill( char c, Color foreground, Color background )
      {
         for ( int y = 0; y < _region.Height; y++ )
         {
            for ( int x = 0; x < _region.Width; x++ )
            {
               _region.Cells[x, y].Char = c;
               _region.Cells[x, y].Foreground = foreground;
               _region.Cells[x, y].Background = background;
            }
         }
      }

      public void FillColor( Color foreground, Color background )
      {
         for ( int y = 0; y < _region.Height; y++ )
         {
            for ( int x = 0; x < _region.Width; x++ )
            {
               _region.Cells[x, y].Foreground = foreground;
               _region.Cells[x, y].Background = background;
            }
         }
      }

      public void FillForeground( Color foreground )
      {
         for ( int y = 0; y < _region.Height; y++ )
         {
            for ( int x = 0; x < _region.Width; x++ )
            {
               _region.Cells[x, y].Foreground = foreground;
            }
         }
      }

      public void Set( int x, int y, char c, Color foreground, Color background )
      {
         _region.Cells[x, y] = new ColorCell( c, foreground, background );
      }

      public void SetLine( int y, string text )
      {
         for ( int x = 0; x < text.Length; x++ )
         {
            _region.Cells[x, y].Char = text[x];
         }
      }
   }
}
