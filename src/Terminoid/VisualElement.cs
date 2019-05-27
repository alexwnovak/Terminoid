using System.Collections.Generic;
using Terminoid.Core;

namespace Terminoid
{
   public abstract class VisualElement
   {
      internal bool IsInitialized { get; set; }
      internal Region Region { get; private set; }

      public int Width { get; private set; }
      public int Height { get; private set; }

      public int Left { get; set; }
      public int Top { get; set; }

      public List<VisualElement> Children { get; } = new List<VisualElement>();

      protected VisualElement( int width, int height )
      {
         Width = width;
         Height = height;
      }

      internal void Initialize()
      {
         Region = new Region( Width, Height );
         var regionContext = new RegionContext( Region );

         CreateRegion( regionContext );
      }

      protected abstract void CreateRegion( RegionContext rc );
   }
}
