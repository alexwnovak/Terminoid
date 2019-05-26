namespace Terminoid.Core
{
   public class Region
   {
      internal Cell[,] Cells { get; }
      public int Width { get; }
      public int Height { get; }

      public Region( int width, int height )
      {
         Cells = new Cell[height, width];
         Width = width;
         Height = height;
      }
   }
}
