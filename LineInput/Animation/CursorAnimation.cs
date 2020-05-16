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

        protected override void OnUpdate(int cursorIndex, TextBuffer textBuffer)
        {
            textBuffer[cursorIndex].Background = new Color((byte)R, (byte)G, (byte)B);
        }
    }
}