using Terminoid.Core;

namespace Terminoid
{
   public static class Screen
   {
      public static void Draw( VisualElement visualElement )
      {
         DrawPositionally( visualElement, visualElement.Left, visualElement.Top );
      }

      private static void DrawPositionally( VisualElement visualElement, int left, int top )
      {
         if ( !visualElement.IsInitialized )
         {
            visualElement.Initialize();
         }

         ConsoleContext.Write( visualElement.Region, left, top );

         foreach ( var childElement in visualElement.Children )
         {
            int relativeChildLeft = visualElement.Left + childElement.Left;
            int relativeChildTop = visualElement.Top + childElement.Top;

            DrawPositionally( childElement, relativeChildLeft, relativeChildTop );
         }
      }
   }
}
