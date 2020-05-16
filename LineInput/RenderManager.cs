using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using LineInput.Animation;

namespace LineInput
{
    public class RenderManager
    {
        private readonly InputState _inputState;
        private readonly CursorPainter _cursorPainter;
        private readonly Thread _thread;

        private bool _isThreadRunning;

        private readonly List<Animatable> _animationObjects = new List<Animatable>();

        public RenderManager(InputState inputState)
        {
            _inputState = inputState;
            _cursorPainter = new CursorPainter();

            _thread = new Thread(ThreadProc);
            _isThreadRunning = false;
        }

        public void StartAsync()
        {
            Console.WriteLine("===== Starting render thread");
            _thread.Start();
        }

        public void Stop()
        {
            _isThreadRunning = false;
        }

        private void StartAnimation(Animatable animatable)
        {
            _animationObjects.Add(animatable);
        }

        private void UpdateAnimation(TimeSpan frameTime, int cursorIndex, TextBuffer textBuffer)
        {
            var completedAnimations = new Queue<Animatable>();

            foreach (var animatable in _animationObjects)
            {
                animatable.Update(frameTime, cursorIndex, textBuffer);

                if (animatable.Progress >= 1)
                {
                    // completedAnimations.Enqueue(animatable);
                }
            }

            foreach (var completedAnimation in completedAnimations)
            {
                _animationObjects.Remove(completedAnimation);
            }
        }

        private void ThreadProc(object parameter)
        {
            _isThreadRunning = true;
            var lastTime = DateTime.Now;

            var cursorAnimation = new CursorAnimation(TimeSpan.FromSeconds(1));
            StartAnimation(cursorAnimation);

            while (_isThreadRunning)
            {
                var elapsedTime = DateTime.Now - lastTime;

                int cursorIndex;
                string text;
                TextBuffer textBuffer;

                lock (_inputState)
                {
                    cursorIndex = _inputState.CursorIndex;
                    // text = _inputState.TextBuffer.ToString();
                    textBuffer = _inputState.TextBuffer.Clone();
                }

                // var output = new StringBuilder(text);

                UpdateAnimation(elapsedTime, cursorIndex, textBuffer);

                // Format and print

                var stringBuilder = new StringBuilder();

                // Console.WriteLine($"Got {textBuffer.Length}");

                for (int i = 0; i < textBuffer.Length; i++)
                {
                    var thisCell = textBuffer[i];

                    if (thisCell.Background != null)
                    {
                        var background = thisCell.Background.Value;
                        stringBuilder.Append($"\x1B[48;2;{background.R};{background.G};{background.B}m{thisCell.Char}\x1B[0m");
                    }
                    else
                    {
                        stringBuilder.Append(thisCell.Char);
                    }
                }

                Console.Write($"\x0D{stringBuilder}");

                lastTime = DateTime.Now;
                Thread.Sleep(30);
            }

            Console.WriteLine("===== Stopping render thread");
        }
    }
}