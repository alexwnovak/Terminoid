using System;

namespace LineInput
{
    internal static class Program
    {
        private static void Main(string[] args)
        {
            var inputController = new InputController();

            var renderManager = new RenderManager(inputController);
            renderManager.StartAsync();

            bool isRunning = true;

            while (isRunning)
            {
                var keyInfo = Console.ReadKey(intercept: true);
                // Console.WriteLine($"===== Key input: {keyInfo.KeyChar}");

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

        //     Console.CursorVisible = false;

        //     var inputController = new InputController();

        //     double theta = 0;
        //     double opacity = 0.5;

        //     while (true)
        //     {

        //         // theta += 0.05;
        //         // opacity = 0.5 + 0.5 * Math.Sin(theta);

        //         // int r = (int)(255.0 * opacity);
        //         // int g = (int)(192.0 * opacity);
        //         // int b = 0;

        //         // Console.Write($"\x0D\x1B[48;2;{r};{g};{b}m \x1B[0m");

        //         int f = Console.Read();
        //         Console.WriteLine($"Got {f}");

        //         // var keyInfo = Console.ReadKey(true);
        //         // Console.WriteLine($"Got key {keyInfo.Key}");
        //         // Thread.Sleep( 16 );

        //         // var keyInfo = Console.ReadKey(true);
        //         // inputController.PressKey(keyInfo.KeyChar);
        //     }
        }
    }
}
