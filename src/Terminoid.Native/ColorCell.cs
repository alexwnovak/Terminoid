namespace Terminoid.Native
{
   public struct ColorCell
   {
      public char Char { get; }
      public Color Foreground { get; }
      public Color Background { get; }

      public ColorCell( char c )
         : this( c, Color.Gray, Color.Black )
      {
      }

      public ColorCell( char c, Color foreground )
         : this( c, foreground, Color.Black )
      {
      }

      public ColorCell( char c, Color foreground, Color background )
      {
         Char = c;
         Foreground = foreground;
         Background = background;
      }
   }
}
