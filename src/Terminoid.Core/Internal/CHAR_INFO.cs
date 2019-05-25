using System.Runtime.InteropServices;

namespace Terminoid.Core.Internal
{
   [StructLayout( LayoutKind.Explicit )]
   internal struct CHAR_INFO
   {
      [FieldOffset( 0 )]
      public char UnicodeChar;

      [FieldOffset( 0 )]
      public char AsciiChar;

      [FieldOffset( 2 )]
      public ushort Attributes;
   }
}
