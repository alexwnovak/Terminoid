using System;

namespace LineInput.Animation
{
    public class CursorAnimation : Animatable
    {
        private const double _twoPi = Math.PI * 2;

        public int R => (int)(128 * Math.Sin(Progress * _twoPi) + 128);
        public int G => (int)(128 * Math.Sin(Progress * _twoPi) + 128);
        public int B => (int)(128 * Math.Sin(Progress * _twoPi) + 128);

        public CursorAnimation(TimeSpan duration) : base(duration)
        {
        }
    }
}