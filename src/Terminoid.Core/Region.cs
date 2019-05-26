namespace Terminoid.Core
{
   public class Region
   {
      internal ColorCell[,] Cells { get; }
      public int Width { get; }
      public int Height { get; }

      public Region( int width, int height )
      {
         Cells = new ColorCell[width, height];
         Width = width;
         Height = height;
      }
   }
}
