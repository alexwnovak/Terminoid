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

        private void UpdateAnimation(TimeSpan frameTime)
        {
            var completedAnimations = new Queue<Animatable>();

            foreach (var animatable in _animationObjects)
            {
                animatable.AddTime(frameTime);

                if (animatable.Progress >= 1)
                {
                    completedAnimations.Enqueue(animatable);
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

                lock (_inputState)
                {
                    cursorIndex = _inputState.CursorIndex;
                    text = _inputState.Text;
                }

                UpdateAnimation(elapsedTime);

                int r = cursorAnimation.R;
                int g = cursorAnimation.G;
                int b = cursorAnimation.B;

                string line = text;

                if (cursorIndex == text.Length)
                {
                    line += $"\x1B[48;2;{r};{g};{b}m \x1B[0m";
                }
                else
                {
                    var sb = new StringBuilder(text);
                    sb.Remove(cursorIndex, 1);
                    char under = text[cursorIndex];

                    sb.Insert(cursorIndex, $"\x1B[48;2;{r};{g};{b}m{under}\x1B[0m");

                    // An extra space at the end will remove the cursor if it was at the end
                    sb.Append("\x1B[0m ");

                    line = sb.ToString();
                }

                Console.Write("\x0D" + line);

                lastTime = DateTime.Now;
                Thread.Sleep(30);
            }

            Console.WriteLine("===== Stopping render thread");
        }
    }
}