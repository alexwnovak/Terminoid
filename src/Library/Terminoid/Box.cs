using Terminoid.Core;

namespace Terminoid
{
   public class Box : VisualElement
   {
      public Box( int width, int height )
         : base( width, height )
      {
      }

      protected override void CreateRegion( RegionContext rc )
      {
         rc.Fill( '\0', Color.White, Color.DarkBlue );
      }
   }
}
