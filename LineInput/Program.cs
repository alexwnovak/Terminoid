using System;
using System.Threading;

namespace LineInput
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            Console.CursorVisible = false;

            var inputController = new InputController();

            double theta = 0;
            double opacity = 0.5;

            while (true)
            {

                theta += 0.05;
                opacity = 0.5 + 0.5 * Math.Sin(theta);

                int r = (int)(255.0 * opacity);
                int g = (int)(192.0 * opacity);
                int b = 0;

                Console.Write($"\x0D\x1B[48;2;{r};{g};{b}m \x1B[0m");
                Thread.Sleep( 16 );

                // var keyInfo = Console.ReadKey(true);
                // inputController.PressKey(keyInfo.KeyChar);
            }
        }
    }
}
