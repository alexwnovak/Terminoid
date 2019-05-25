namespace Terminoid.Core
{
   public struct ColorCell
   {
      public char Char { get; internal set; }
      public Color Foreground { get; internal set; }
      public Color Background { get; internal set; }

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
