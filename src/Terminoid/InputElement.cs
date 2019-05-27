namespace Terminoid
{
   public abstract class InputElement : VisualElement
   {
      protected InputElement( int width, int height )
         : base( width, height )
      {
      }

      protected internal abstract void InputHandler();
   }
}
