namespace Terminoid.Core
{
   public class Region
   {
      protected char[] _charBuffer;
      private readonly ushort[] _attrBuffer;

      public int Width { get; }
      public int Height { get; }

      public Region( int width, int height )
      {
         Width = width;
         Height = height;

         _charBuffer = new char[Width * Height];
         _attrBuffer = new ushort[Width * Height];
      }

      public char[] GetCharBuffer() => _charBuffer;
      public ushort[] GetAttrBuffer() => _attrBuffer;
   }
}
