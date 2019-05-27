using Terminoid.Core;

namespace Terminoid
{
   public static class Screen
   {
      public static void Draw( VisualElement visualElement )
      {
         if ( !visualElement.IsInitialized )
         {
            visualElement.Initialize();
         }

         ConsoleContext.Write( visualElement.Region, visualElement.Left, visualElement.Top );

         foreach ( var childElement in visualElement.Children )
         {
            Draw( childElement );
         }
      }
   }
}
