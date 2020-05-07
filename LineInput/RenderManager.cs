using System;
using System.Threading;

namespace LineInput
{
    public class RenderManager
    {
        private readonly IInputController _inputController;
        private readonly CursorPainter _cursorPainter;
        private readonly Thread _thread;

        private bool _isThreadRunning;
        private bool _requestRepaint;

        public RenderManager(IInputController inputController)
        {
            _inputController = inputController;
            _inputController.InputChanged += OnInputChanged;

            _cursorPainter = new CursorPainter();

            _thread = new Thread(ThreadProc);
            _isThreadRunning = false;
        }

        private void OnInputChanged(object sender, EventArgs e)
        {
            RequestRepaint();
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

        public void RequestRepaint()
        {
            _requestRepaint = true;
        }

        private void ThreadProc(object parameter)
        {
            _isThreadRunning = true;
            var lastTime = DateTime.Now;

            double theta = 0;
            double opacity;

            while (_isThreadRunning)
            {
                var elapsedTime = DateTime.Now - lastTime;

                theta += elapsedTime.TotalMilliseconds * 0.005;
                opacity = 0.5 + 0.5 * Math.Sin(theta);

                int r = (int)(255.0 * opacity);
                int g = 0; //(int)(192.0 * opacity);
                int b = (int)(255.0 * opacity);

                string buffer = _inputController.GetBuffer();
                string line = "\x0D" + buffer;

                if (_inputController.CursorIndex == buffer.Length)
                {
                    line += $"\x1B[48;2;{r};{g};{b}m \x1B[0m";
                }
                else
                {
                    line = line.Insert(_inputController.CursorIndex, $"\x1B[48;2;{r};{g};{b}m \x1B[0m");
                }

                Console.Write(line);

                // _cursorPainter.Paint(elapsedTime.TotalMilliseconds);

                lastTime = DateTime.Now;
                Thread.Sleep(20);
            }

            Console.WriteLine("===== Stopping render thread");
        }
    }
}