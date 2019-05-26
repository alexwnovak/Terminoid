namespace Terminoid.Core
{
   public class Region
   {
      internal ColorCell[,] Cells { get; }
      public int Width { get; }
      public int Height { get; }

      public Region( int width, int height )
      {
         Cells = new ColorCell[height, width];
         Width = width;
         Height = height;
      }
   }
}
