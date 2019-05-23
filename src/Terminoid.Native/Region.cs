namespace Terminoid.Native
{
   public class Region
   {
      private readonly char[] _charBuffer;
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

      internal char[] GetCharBuffer() => _charBuffer;
      internal ushort[] GetAttrBuffer() => _attrBuffer;
   }
}
