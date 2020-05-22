using System;

namespace LineInput.Animation
{
    public class Clock
    {
        public TimeSpan ElapsedTime { get; private set; }

        public void AddTime(TimeSpan timeSpan)
        {
            ElapsedTime += timeSpan;
            OnTimeAdded(timeSpan);
        }

        protected virtual void OnTimeAdded(TimeSpan timeSpan) { }
    }
}