using Terminoid.Core;

namespace Terminoid
{
   public class Shadow : VisualElement
   {
      public Shadow( int width, int height )
         : base( width, height )
      {
      }

      protected override void CreateRegion( RegionContext rc )
      {
         rc.Fill( Color.DarkGray, Color.Black );
      }
   }
}
