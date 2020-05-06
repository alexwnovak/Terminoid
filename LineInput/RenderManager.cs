using System;
using System.Threading;

namespace LineInput
{
    public class RenderManager
    {
        private readonly IInputController _inputController;
        private readonly Thread _thread;

        private bool _isThreadRunning;
        private bool _requestRepaint;

        public RenderManager(IInputController inputController)
        {
            _inputController = inputController;
            _inputController.InputChanged += OnInputChanged;

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

            while (_isThreadRunning)
            {
                if (_requestRepaint)
                {
                    _requestRepaint = false;
                    Console.WriteLine($"===== Repaint: {_inputController.GetBuffer()}");
                }

                Thread.Sleep(100);
            }

            Console.WriteLine("===== Stopping render thread");
        }
    }
}