using System;

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

        public override void Render(int cursorIndex, TextBuffer textBuffer)
        {
            // TODO: Animations shouldn't have a Render; they should update and modify
            // the TextBuffer data structure, NOT rasterize the data into VT sequences.
            // This should be some part of the RenderManager part--that guy flattens the
            // data structure into something that can be printed. He deals with the raw output.

            textBuffer[cursorIndex].Background = new Color(255, 0, 0);

            // if (cursorIndex == textBuffer.Length)
            // {
            //     textBuffer.Append($"\x1B[48;2;{R};{G};{B}m \x1B[0m");
            // }
            // else
            // {
            //     var under = textBuffer[cursorIndex];
            //     under.
            //     textBuffer.Remove(cursorIndex);

            //     textBuffer.Insert(cursorIndex, $"\x1B[48;2;{R};{G};{B}m{under.Char}\x1B[0m");

            //     // An extra space at the end will remove the cursor if it was at the end
            //     textBuffer.Append("\x1B[0m ");
            // }
        }
    }
}