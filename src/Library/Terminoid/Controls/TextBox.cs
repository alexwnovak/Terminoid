using System;
using Terminoid.Core;

namespace Terminoid.Controls
{
   public class TextBox : InputElement
   {
      private string _text;

      public TextBox( int width, int height )
         : base( width, height )
      {
      }

      protected override void CreateRegion( RegionContext rc )
      {
         rc.Fill( Color.White, Color.DarkRed );
      }

      protected override void OnPaint( RegionContext rc )
      {
         rc.SetLine( 0, _text );
      }

      protected override void InputHandler( InputContext inputContext )
      {
         if ( inputContext.KeyInfo.Key == ConsoleKey.Enter )
         {
            inputContext.Complete();
            return;
         }

         _text += inputContext.KeyInfo.KeyChar;
         Invalidate();
      }
   }
}
