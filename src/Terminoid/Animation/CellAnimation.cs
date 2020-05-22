using System;

namespace LineInput.Animation
{
    public class CellAnimation : Animatable
    {
        public CellAnimation(TimeSpan duration) : base(duration, RepeatBehavior.Forever)
        {
        }

    }
}