using System;
using System.Text;
using System.Threading;

namespace LineInput
{
    public class RenderManager
    {
        private readonly InputState _inputState;
        private readonly CursorPainter _cursorPainter;
        private readonly Thread _thread;

        private bool _isThreadRunning;

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

        private void ThreadProc(object parameter)
        {
            _isThreadRunning = true;
            var lastTime = DateTime.Now;

            double theta = 0;
            double opacity;

            while (_isThreadRunning)
            {
                int cursorIndex;
                string text;

                lock (_inputState)
                {
                    cursorIndex = _inputState.CursorIndex;
                    text = _inputState.Text;
                }

                var elapsedTime = DateTime.Now - lastTime;

                theta += elapsedTime.TotalMilliseconds * 0.005;
                opacity = 0.5 + 0.5 * Math.Sin(theta);

                int r = (int)(255.0 * opacity);
                int g = 0; //(int)(192.0 * opacity);
                int b = (int)(255.0 * opacity);

                string buffer = _inputState.Text;
                string line = buffer;

                if (_inputState.CursorIndex == buffer.Length)
                {
                    line += $"\x1B[48;2;{r};{g};{b}m \x1B[0m";
                }
                else
                {
                    var sb = new StringBuilder(buffer);
                    sb.Remove(_inputState.CursorIndex, 1);
                    char under = buffer[_inputState.CursorIndex];

                    sb.Insert(_inputState.CursorIndex, $"\x1B[48;2;{r};{g};{b}m{under}\x1B[0m");

                    // An extra space at the end will remove the cursor if it was at the end
                    sb.Append("\x1B[0m ");

                    line = sb.ToString();
                }

                Console.Write("\x0D" + line);

                lastTime = DateTime.Now;
                Thread.Sleep(10);
            }

            Console.WriteLine("===== Stopping render thread");
        }
    }
}