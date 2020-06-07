using System;

namespace Terminoid.Animation
{
    public class CursorAnimation : Animatable
    {
        private readonly Color _colorOne;
        private readonly Color _colorTwo;

        private readonly int _redDelta;
        private readonly int _greenDelta;
        private readonly int _blueDelta;

        public CursorAnimation(TimeSpan duration, Color colorOne, Color colorTwo) : base(duration, RepeatBehavior.Forever)
        {
            _colorOne = colorOne;
            _colorTwo = colorTwo;

            _redDelta = _colorTwo.R - _colorOne.R;
            _greenDelta = _colorTwo.G - _colorOne.G;
            _blueDelta = _colorTwo.B - _colorOne.B;
        }

        protected override void OnUpdate(int cursorIndex, TextBuffer textBuffer)
        {
            double wave = 0.5 * Math.Sin(Progress * Math.PI * 2) + 0.5;

            int red = Math.Clamp((int)(_colorOne.R + wave * _redDelta), 0, 255);
            int green = Math.Clamp((int)(_colorOne.G + wave * _greenDelta), 0, 255);
            int blue = Math.Clamp((int)(_colorOne.B + wave * _blueDelta), 0, 255);

            textBuffer[cursorIndex].Background = Color.FromRgb((byte)red, (byte)green, (byte)blue);
        }
    }
}