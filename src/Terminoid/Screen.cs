using System;
using Terminoid.Core;

namespace Terminoid
{
   public static class Screen
   {
      public static void Use( InputElement inputElement )
      {
         try
         {
            inputElement.RequestDraw += OnRequestDraw;

            Draw( inputElement );
            inputElement.Use();
         }
         finally
         {
            inputElement.RequestDraw -= OnRequestDraw;
         }

         void OnRequestDraw( object sender, EventArgs e ) => Draw( inputElement );
      }

      public static void Draw( VisualElement visualElement )
      {
         DrawPositionally( visualElement, visualElement.Left, visualElement.Top );
      }

      private static void DrawPositionally( VisualElement visualElement, int left, int top )
      {
         if ( !visualElement.IsInitialized )
         {
            visualElement.Initialize();
            visualElement.IsInitialized = true;
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
