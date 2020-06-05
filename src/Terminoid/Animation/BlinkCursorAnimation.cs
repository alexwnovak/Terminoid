using System;
using Terminoid;

namespace LineInput.Animation
{
    public class BlinkCursorAnimation : Animatable
    {
        private readonly Color _colorOne;
        private readonly Color _colorTwo;

        public BlinkCursorAnimation(Color one, Color two, TimeSpan duration) : base(duration, RepeatBehavior.Forever)
        {
            _colorOne = one;
            _colorTwo = two;
        }

        protected override void OnUpdate(int cursorIndex, TextBuffer textBuffer)
        {
            double sine = Math.Sin(Progress * Math.PI * 2);
            textBuffer[cursorIndex].Background = sine > 0 ? _colorOne : _colorTwo;
        }
    }
}