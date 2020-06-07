using System;
using System.Management.Automation;

namespace Terminoid.Cmdlets
{
    [Cmdlet(VerbsCommon.Select, "FromMany")]
    public class SelectFromManyCmdlet : PSCmdlet
    {
        private int _selectedIndex = 0;

        [Parameter(
            Mandatory = true,
            Position = 0
        )]
        public object[] Choices { get; set; }

        protected override void ProcessRecord()
        {
            RenderChoices();
            var choice = GetChoice();
            WriteObject(choice);
        }

        private object GetChoice()
        {
            while (true)
            {
                var key = Console.ReadKey(true);

                switch (key.Key)
                {
                    case ConsoleKey.Enter:
                        return Choices[_selectedIndex];
                    case ConsoleKey.Escape:
                        return null;
                    case ConsoleKey.UpArrow:
                        _selectedIndex = _selectedIndex == 0 ? 0 : _selectedIndex - 1;
                        break;
                    case ConsoleKey.DownArrow:
                        _selectedIndex = _selectedIndex == Choices.Length - 1 ? Choices.Length - 1 : _selectedIndex + 1;
                        break;
                }

                Console.WriteLine($"\x1B[{Choices.Length + 1}A");
                RenderChoices();
            }
        }

        private void RenderChoices()
        {
            for (int index = 0; index < Choices.Length; index++)
            {
                if (index == _selectedIndex)
                {
                    var formatBuilder = new FormatBuilder();
                    formatBuilder.PushForeground(Color.FromRgb(119, 144, 203));
                    formatBuilder.Append("\uE0B6");
                    formatBuilder.PushForeground(Color.FromRgb(255, 255, 255));
                    formatBuilder.PushBackground(Color.FromRgb(119, 144, 203));
                    formatBuilder.Append(" {0} ");
                    formatBuilder.PushForeground(Color.FromRgb(119, 144, 203));
                    formatBuilder.PopBackground();
                    formatBuilder.Append("\uE0B4");
                    formatBuilder.ResetAllFormatting();

                    Console.WriteLine(string.Format(formatBuilder.ToString(), Choices[index]));
                }
                else
                {
                    Console.WriteLine($"  {Choices[index]}  ");
                }
            }
        }
    }
}