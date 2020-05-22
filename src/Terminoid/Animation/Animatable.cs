using System;

namespace LineInput.Animation
{
    public class Animatable
    {
        public TimeSpan Duration { get; }
        public RepeatBehavior RepeatBehavior { get; }

        public TimeSpan ElapsedTime { get; private set; }
        public double Progress { get; private set; }
        public bool IsComplete => RepeatBehavior == RepeatBehavior.Once && ElapsedTime >= Duration;

        public Animatable(TimeSpan duration, RepeatBehavior repeatBehavior)
        {
            Duration = duration;
            RepeatBehavior = repeatBehavior;
        }

        public void Update(TimeSpan timeSpan, int cursorIndex, TextBuffer textBuffer)
        {
            ElapsedTime += timeSpan;
            Progress = ElapsedTime.TotalMilliseconds / Duration.TotalMilliseconds;

            OnUpdate(cursorIndex, textBuffer);
        }

        public void AddTime(TimeSpan timeSpan)
        {
            ElapsedTime += timeSpan;
            UpdateProgress(timeSpan);
        }

        protected void UpdateProgress(TimeSpan timeSpan)
        {
            Progress = ElapsedTime.TotalMilliseconds / Duration.TotalMilliseconds;
        }

        protected virtual void OnUpdate(int cursorIndex, TextBuffer textBuffer) { }
    }
}