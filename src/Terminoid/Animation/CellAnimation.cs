using System;

namespace Terminoid.Animation
{
    public class CellAnimation : Animatable
    {
        public CellAnimation(TimeSpan duration) : base(duration, RepeatBehavior.Forever)
        {
        }

    }
}