using System;

namespace LineInput
{
    internal static class Program
    {
        private static void Main(string[] args)
        {
            Console.CursorVisible = false;
            Console.WriteLine("===== Starting");

            var inputState = new InputState();
            inputState.TextBuffer.Append(new Cell('_'));
            var inputStateManager = new InputStateManager(inputState);

            var inputController = new InputController
            {
                InputStateManager = inputStateManager
            };

            var renderManager = new RenderManager(inputState);
            renderManager.StartAsync();

            bool isRunning = true;

            while (isRunning)
            {
                var keyInfo = Console.ReadKey(intercept: true);

                if (keyInfo.Key == ConsoleKey.Escape)
                {
                    Console.WriteLine("===== Exiting input loop");
                    isRunning = false;
                }
                else
                {
                    inputController.PressKey(keyInfo);
                }
            }

            renderManager.Stop();
            Console.CursorVisible = true;
        }
    }
}
