using System;

namespace LineInput
{
    public static class Program
    {
        public static string Get()
        {
            Console.CursorVisible = false;
            // Console.WriteLine("===== Starting");

            var inputState = new InputState();
            var inputStateManager = new InputStateManager(inputState);

            var inputController = new InputController
            {
                InputStateManager = inputStateManager
            };

            var renderManager = new RenderManager(inputState);
            renderManager.StartAsync();

            bool isRunning = true;
            string output = null;

            while (isRunning)
            {
                var keyInfo = Console.ReadKey(intercept: true);

                if (keyInfo.Key == ConsoleKey.Escape)
                {
                    // Console.WriteLine("===== Exiting input loop");
                    isRunning = false;
                }
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

            renderManager.Stop();
            Console.CursorVisible = true;

            return output;
        }

        public static void Main(string[] args)
        {
            Get();
        }
    }
}
