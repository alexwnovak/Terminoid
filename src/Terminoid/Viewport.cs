using System;

namespace Terminoid
{
   public static class Viewport
   {
      public static int Left => Console.WindowLeft;
      public static int Top => Console.WindowTop;
      public static int Right => Left + Console.WindowWidth;
      public static int Bottom => Top + Console.WindowHeight;
   }
}
