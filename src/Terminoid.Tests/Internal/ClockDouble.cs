using System;
using Terminoid.Animation;

namespace Terminoid.Tests.Internal
{
    internal class ClockDouble : Clock
    {
        public TimeSpan AddedTime { get; private set;}

        protected override void OnTimeAdded(TimeSpan timeSpan) => AddedTime = timeSpan;
    }
}