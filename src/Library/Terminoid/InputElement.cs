using System;
using Terminoid.Core;

namespace Terminoid
{
   public abstract class InputElement : VisualElement
   {
      internal EventHandler RequestDraw;

      protected InputElement( int width, int height )
         : base( width, height )
      {
      }

      public void Invalidate()
      {
         var regionContext = new RegionContext( Region );
         OnPaint( regionContext );
         RequestDraw?.Invoke( this, EventArgs.Empty );
      }

      protected virtual void OnPaint( RegionContext rc )
      {
      }

      internal void Use()
      {
         while ( true )
         {
            var keyInfo = Console.ReadKey( true );
            var inputContext = new InputContext( keyInfo );

            InputHandler( inputContext );

            if ( inputContext.ShouldExit )
            {
               break;
            }
         }
      }

      protected abstract void InputHandler( InputContext inputContext );
   }
}
