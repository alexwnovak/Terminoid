using System;
using LineInput;

namespace Terminoid
{
    public static class LineInput
    {
        public static string ReadLine()
        {
            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            var inputController = new InputController
            {
                InputStateManager = inputStateManager
            };

            RenderManager.Instance.EnableFocus(inputState);

            bool isRunning = true;
            string output = null;

            while (isRunning)
            {
                var keyInfo = Console.ReadKey(intercept: true);

                if (keyInfo.Key == ConsoleKey.Enter)
                {
                    var rasterizer = new VTRasterizer();
                    output = rasterizer.Rasterize(inputState.TextBuffer);
                    isRunning = false;
                }
                else
                {
                    inputController.PressKey(keyInfo);
                }
            }

            RenderManager.Instance.DisableFocus();
            return output;
        }
    }
}