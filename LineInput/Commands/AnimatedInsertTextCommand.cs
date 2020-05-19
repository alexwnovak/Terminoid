using System;
using LineInput.Animation;

namespace LineInput.Commands
{
    public class AnimatedInsertTextCommand : Animatable, IInputStateCommand<string>
    {
        public AnimatedInsertTextCommand(TimeSpan duration) : base(duration, RepeatBehavior.Once)
        {
        }

        public void Execute(IWritableInputState inputState, string parameter)
        {
            Console.WriteLine($"Got {parameter}");
        }
    }
}