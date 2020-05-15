using System;
using System.Text;

namespace LineInput.Animation
{
    public class CursorAnimation : Animatable
    {
        private const double _twoPi = Math.PI * 2;

        public int R => 0;
        public int G => (int)(64 * Math.Sin(Progress * _twoPi) + 192);
        public int B => (int)(64 * Math.Sin(Progress * _twoPi) + 192);

        public CursorAnimation(TimeSpan duration) : base(duration)
        {
        }

        public override void Render(int cursorIndex, StringBuilder output)
        {
            if (cursorIndex == output.Length)
            {
                output.Append($"\x1B[48;2;{R};{G};{B}m \x1B[0m");
            }
            else
            {
                char under = output[cursorIndex];
                output.Remove(cursorIndex, 1);

                output.Insert(cursorIndex, $"\x1B[48;2;{R};{G};{B}m{under}\x1B[0m");

                // An extra space at the end will remove the cursor if it was at the end
                output.Append("\x1B[0m ");
            }
        }
    }
}