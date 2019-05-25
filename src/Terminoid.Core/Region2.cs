namespace Terminoid.Core
{
   public class Region2
   {
      internal ColorCell[,] Cells { get; }
      public int Width { get; }
      public int Height { get; }

      public Region2( int width, int height )
      {
         Cells = new ColorCell[width, height];
         Width = width;
         Height = height;
      }

      public ColorCell Get( int x, int y ) => Cells[x, y];
      public void Set( int x, int y, ColorCell cell ) => Cells[x, y] = cell;
   }
}
