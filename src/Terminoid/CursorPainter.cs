using System;

namespace LineInput
{
    public class CursorPainter
    {
        private double _theta = 0;
        private double _opacity = 0.5;

        public void Paint(double time)
        {
            _theta += 0.05;
            _opacity = 0.5 + 0.5 * Math.Sin(_theta);

            int r = (int)(255.0 * _opacity);
            int g = (int)(192.0 * _opacity);
            int b = 0;

            Console.Write($"\x0D\x1B[48;2;{r};{g};{b}m \x1B[0m");
        }

    }
}