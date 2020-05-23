using System;
using System.Collections.Generic;
using System.Threading;
using LineInput.Animation;

namespace LineInput
{
    public class RenderManager
    {
        public static RenderManager Instance { get; } = new RenderManager();

        private bool _isInitialized;
        private bool _isThreadRunning;
        private bool _hasFocus;

        private Thread _renderThread;
        private InputState _inputState;

        private readonly List<Animatable> _animationObjects = new List<Animatable>();

        private RenderManager()
        {
        }

        public void Initialize()
        {
            Console.WriteLine("===== Initializing");

            if (!_isInitialized)
            {
                _isInitialized = true;
                _renderThread = new Thread(RenderThreadProc);
                _renderThread.IsBackground = true;
                _renderThread.Start();
            }
        }

        private void RenderThreadProc()
        {
            _isThreadRunning = true;

            Console.WriteLine("===== Starting render thread");

            var lastTime = DateTime.Now;

            while (_isThreadRunning)
            {
                var elapsedTime = DateTime.Now - lastTime;

                if (_hasFocus)
                {
                    int cursorIndex;
                    TextBuffer textBuffer;

                    lock (_inputState)
                    {
                        cursorIndex = _inputState.CursorIndex;
                        textBuffer = _inputState.TextBuffer.Clone();
                    }

                    RenderThreadUpdate(elapsedTime, cursorIndex, textBuffer);
                }

                lastTime = DateTime.Now;
                Thread.Sleep(30);
            }

            Console.WriteLine("===== Stopping render thread");
        }

        private void RenderThreadUpdate(TimeSpan frameTime, int cursorIndex, TextBuffer textBuffer)
        {
            UpdateAnimation(frameTime, cursorIndex, textBuffer);
            WriteTextBuffer(textBuffer);
        }

        public void EnableFocus(InputState inputState)
        {
            _inputState = inputState;

            var cursorAnimation = new CursorAnimation(TimeSpan.FromSeconds(0.5), Color.FromRgb(18, 55, 64), Color.FromRgb(84, 154, 171));
            StartAnimation(cursorAnimation);

            _hasFocus = true;
        }

        public void DisableFocus()
        {
            _hasFocus = false;
        }

        public void ShutDown()
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

                if (animatable.IsComplete)
                {
                    completedAnimations.Enqueue(animatable);
                }
            }

            foreach (var completedAnimation in completedAnimations)
            {
                _animationObjects.Remove(completedAnimation);
            }
        }

        private void WriteTextBuffer(TextBuffer textBuffer)
        {
            var rasterizer = new VTRasterizer();
            string rasterizedOutput = rasterizer.Rasterize(textBuffer);

            Console.Write($"\x0D{rasterizedOutput}");
        }
    }
}