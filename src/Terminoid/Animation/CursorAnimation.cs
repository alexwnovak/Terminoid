using System;

namespace LineInput.Animation
{
    public class CursorAnimation : Animatable
    {
        private const double _twoPi = Math.PI * 2;

        public CursorAnimation(TimeSpan duration) : base(duration, RepeatBehavior.Forever)
        {
        }

        protected override void OnUpdate(int cursorIndex, TextBuffer textBuffer)
        {
            byte g = (byte)(64 * Math.Sin(Progress * _twoPi) + 192);
            byte b = (byte)(64 * Math.Sin(Progress * _twoPi) + 192);

            textBuffer[cursorIndex].Background = Color.FromRgb(0, g, b);
        }
    }
}