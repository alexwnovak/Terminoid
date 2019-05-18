using System;
using System.Runtime.InteropServices;

namespace Terminoid.Native
{
   internal static class NativeMethods
   {
      public const int STD_OUTPUT_HANDLE = -11;

      [DllImport( "kernel32.dll", SetLastError = true )]
      public static extern IntPtr GetStdHandle( int nStdHandle );

      [DllImport( "kernel32.dll" )]
      public static extern bool ReadConsoleOutputCharacter(
         IntPtr hConsoleOutput,
         [Out] char[] lpCharacter,
         uint nLength,
         COORD dwReadCoord,
         out uint lpNumberOfCharsRead );

      [DllImport( "kernel32.dll", CharSet = CharSet.Unicode )]
      public unsafe static extern bool WriteConsoleOutputCharacter(
         IntPtr hConsoleOutput,
         char* lpCharacter,
         uint nLength,
         COORD dwWriteCoord,
         out uint lpNumberOfCharsWritten );

      [DllImport( "kernel32.dll" )]
      public static extern bool ReadConsoleOutputAttribute(
         IntPtr hConsoleOutput,
         [Out] ushort[] lpAttribute,
         uint nLength,
         COORD dwReadCoord,
         out uint lpNumberOfCharsRead );

      [DllImport( "kernel32.dll" )]
      public unsafe static extern bool WriteConsoleOutputAttribute(
         IntPtr hConsoleOutput,
         ushort* lpAttribute,
         uint nLength,
         COORD dwWriteCoord,
         out uint lpNumberOfAttrsWritten );
   }
}
