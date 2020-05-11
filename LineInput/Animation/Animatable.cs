using System;

namespace LineInput.Animation
{
    public class Animatable
    {
        public TimeSpan ElapsedTime { get; private set; }
        public double Progress { get; private set; }
        public TimeSpan Duration { get; }

        public Animatable(TimeSpan duration)
        {
            Duration = duration;
        }

        public void AddTime(TimeSpan timeSpan)
        {
            ElapsedTime += timeSpan;
            UpdateProgress(timeSpan);
        }

        protected void UpdateProgress(TimeSpan timeSpan)
        {
            Progress = ElapsedTime.TotalMilliseconds / Duration.TotalMilliseconds;

            // if (Progress >= 1)
            // {
            //     Progress = 0;
            // }

            // Console.WriteLine($"Progress {Progress}");
        }
    }
}