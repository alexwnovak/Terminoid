namespace Terminoid.Core
{
   internal static class ColorMask
   {
      public static Color GetForeground( ushort attribute )
      {
         int index = attribute & 0x0F;
         return Color.FromIndex( index );
      }

      public static Color GetBackground( ushort attribute )
      {
         int index = ( attribute >> 4 ) & 0x0F;
         return Color.FromIndex( index );
      }

      public static ushort GetAttribute( Color foreground, Color background )
      {
         return (ushort) ( ( background.Value << 4 ) | foreground.Value );
      }
   }
}
