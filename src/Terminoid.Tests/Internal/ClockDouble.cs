using System;
using LineInput.Animation;

namespace LineInput.Tests.Internal
{
    internal class ClockDouble : Clock
    {
        public TimeSpan AddedTime { get; private set;}

        protected override void OnTimeAdded(TimeSpan timeSpan) => AddedTime = timeSpan;
    }
}