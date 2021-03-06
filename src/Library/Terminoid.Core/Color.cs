﻿namespace Terminoid.Core
{
   public struct Color
   {
      public static readonly Color Transparent = new Color( -1 );
      public static readonly Color Black = new Color( 0 );
      public static readonly Color DarkBlue = new Color( 1 );
      public static readonly Color DarkGreen = new Color( 2 );
      public static readonly Color DarkCyan = new Color( 3 );
      public static readonly Color DarkRed = new Color( 4 );
      public static readonly Color DarkMagenta = new Color( 5 );
      public static readonly Color DarkYellow = new Color( 6 );
      public static readonly Color Gray = new Color( 7 );
      public static readonly Color DarkGray = new Color( 8 );
      public static readonly Color Blue = new Color( 9 );
      public static readonly Color Green = new Color( 10 );
      public static readonly Color Cyan = new Color( 11 );
      public static readonly Color Red = new Color( 12 );
      public static readonly Color Magenta = new Color( 13 );
      public static readonly Color Yellow = new Color( 14 );
      public static readonly Color White = new Color( 15 );

      private static readonly Color[] _colorTable = new []
      {
         Black,
         DarkBlue,
         DarkGreen,
         DarkCyan,
         DarkRed,
         DarkMagenta,
         DarkYellow,
         Gray,
         DarkGray,
         Blue,
         Green,
         Cyan,
         Red,
         Magenta,
         Yellow,
         White
      };

      internal int Value { get; }

      private Color( int value ) => Value = value;

      public override int GetHashCode() => Value;

      public override bool Equals( object obj )
      {
         if ( !( obj is Color ) )
         {
            return false;
         }

         var second = (Color) obj;
         return Value == second.Value;
      }

      public static bool operator ==( Color first, Color second ) => Equals( first, second );
      public static bool operator !=( Color first, Color second ) => !( first == second );

      internal static Color FromIndex( int index ) => _colorTable[index];
   }
}
