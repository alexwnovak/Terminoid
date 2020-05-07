using System;

namespace LineInput
{
    internal static class Program
    {
        private static void Main(string[] args)
        {
            Console.CursorVisible = false;
            Console.WriteLine("===== Starting");

            var inputController = new InputController();

            var renderManager = new RenderManager(inputController);
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
                    inputController.PressKey(keyInfo.KeyChar);
                }
            }

            renderManager.Stop();
            Console.CursorVisible = true;
        }
    }
}
