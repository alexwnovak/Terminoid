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

            bool exit = false;
            object selectedValue = null;

            while (!exit)
            {
                var key = Console.ReadKey(true);

                switch (key.Key)
                {
                    case ConsoleKey.Enter:
                        selectedValue = Choices[_selectedIndex];
                        exit = true;
                        break;
                    case ConsoleKey.Escape:
                        exit = true;
                        break;
                    case ConsoleKey.UpArrow:
                        _selectedIndex = _selectedIndex == 0 ? 0 : _selectedIndex - 1;
                        break;
                    case ConsoleKey.DownArrow:
                        _selectedIndex = _selectedIndex == Choices.Length - 1 ? Choices.Length - 1 : _selectedIndex + 1;
                        break;
                }

                if (exit)
                {
                    break;
                }

                Console.WriteLine($"\x1B[{Choices.Length + 1}A");
                RenderChoices();
            }

            WriteObject(selectedValue);
        }

        private void RenderChoices()
        {
            for (int index = 0; index < Choices.Length; index++)
            {
                if (index == _selectedIndex)
                {
                    Console.WriteLine($"* {Choices[index]}");
                }
                else
                {
                    Console.WriteLine($"  {Choices[index]}");
                }
            }
        }
    }
}