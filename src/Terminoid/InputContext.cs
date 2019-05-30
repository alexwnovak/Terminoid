using System;

namespace Terminoid
{
   public class InputContext
   {
      internal bool ShouldExit { get; private set; }

      public ConsoleKeyInfo KeyInfo { get; }

      public InputContext( ConsoleKeyInfo keyInfo ) => KeyInfo = keyInfo;

      public void Complete() => ShouldExit = true;
   }
}
