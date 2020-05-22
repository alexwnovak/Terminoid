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
        private Thread _renderThread;

        private bool _isThreadRunning;

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

        public void ShutDown()
        {
            _isThreadRunning = false;
        }

        private void RenderThreadProc()
        {
            _isThreadRunning = true;

            Console.WriteLine("===== Starting render thread");

            while (_isThreadRunning)
            {
                Thread.Sleep(2000);
                Console.Write("RT");
            }

            Console.WriteLine("===== Stopping render thread");
        }

        private readonly InputState _inputState;
        private readonly Thread _thread;


        private readonly List<Animatable> _animationObjects = new List<Animatable>();

        private RenderManager()
        {
        }

        public RenderManager(InputState inputState)
        {
            _inputState = inputState;

            _thread = new Thread(ThreadProc);
            _isThreadRunning = false;
        }

        public void StartAsync()
        {
            // Console.WriteLine("===== Starting render thread");
            // _thread.Start();
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

        private void ThreadProc(object parameter)
        {
            _isThreadRunning = true;
            var lastTime = DateTime.Now;

            var cursorAnimation = new CursorAnimation(TimeSpan.FromSeconds(0.5));
            // var cursorAnimation = new BlinkCursorAnimation(Color.FromRgb(192, 0, 0), Color.FromRgb(255, 0, 0), TimeSpan.FromSeconds(1));
            StartAnimation(cursorAnimation);

            while (_isThreadRunning)
            {
                var elapsedTime = DateTime.Now - lastTime;

                int cursorIndex;
                TextBuffer textBuffer;

                lock (_inputState)
                {
                    cursorIndex = _inputState.CursorIndex;
                    textBuffer = _inputState.TextBuffer.Clone();
                }

                UpdateAnimation(elapsedTime, cursorIndex, textBuffer);

                // Format and print

                var rasterizer = new VTRasterizer();
                string rasterizedOutput = rasterizer.Rasterize(textBuffer);

                Console.Write($"\x0D{rasterizedOutput}");

                lastTime = DateTime.Now;
                Thread.Sleep(30);
            }

            // Console.WriteLine("===== Stopping render thread");
        }
    }
}