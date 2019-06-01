namespace Terminoid.Core
{
   public struct Cell
   {
      public char Char { get; internal set; }
      public Color Foreground { get; internal set; }
      public Color Background { get; internal set; }

      public Cell( char c )
         : this( c, Color.Gray, Color.Black )
      {
      }

      public Cell( char c, Color foreground )
         : this( c, foreground, Color.Black )
      {
      }

      public Cell( char c, Color foreground, Color background )
      {
         Char = c;
         Foreground = foreground;
         Background = background;
      }
   }
}
