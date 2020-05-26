using System;
using System.Management.Automation;

namespace Terminoid.Cmdlets
{
    [Cmdlet(VerbsCommon.Format, "Date")]
    [OutputType(typeof(string))]
    public class FormatDateCmdlet : PSCmdlet
    {
        private const int _oneWeek = 7;
        private const int _twoWeeks = _oneWeek * 2;
        private const int _oneMonth = 30;
        private const int _twoMonths = _oneMonth * 2;
        private const int _oneYear = 365;
        private const int _twoYears = _oneYear * 2;
        private const int _tenYears = _oneYear * 10;
        private const int _twentyYears = _oneYear * 20;
        private const int _oneHundredYears = _oneYear * 100;
        private const int _twoHundredYears = _oneYear * 200;
        private const int _oneMillennium = _oneYear * 1000;
        private const int _twoMillennia = _oneMillennium * 2;

        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromPipeline = true
        )]
        public DateTime Date { get; set; }

        protected override void ProcessRecord()
        {
            var elapsedTime = DateTime.Now - Date;

            if (elapsedTime.TotalDays > _twoMillennia)
            {
                WriteObject("more than a millennia ago");
            }
            else if (elapsedTime.TotalDays >= _oneMillennium && elapsedTime.TotalDays <= _twoMillennia)
            {
                WriteObject("last millennium");
            }
            else if (elapsedTime.TotalDays >= _twoHundredYears && elapsedTime.TotalDays <= _oneMillennium)
            {
                int centuries = (int)(elapsedTime.TotalDays / 365 / 100);
                WriteObject($"{centuries} centuries ago");
            }
            else if (elapsedTime.TotalDays >= _oneHundredYears && elapsedTime.TotalDays <= _twoHundredYears)
            {
                WriteObject("last century");
            }
            else if (elapsedTime.TotalDays >= _twentyYears && elapsedTime.TotalDays <= _oneHundredYears)
            {
                int decades = (int)(elapsedTime.TotalDays / 365 / 10);
                WriteObject($"{decades} decades ago");
            }
            else if (elapsedTime.TotalDays >= _tenYears && elapsedTime.TotalDays <= _twentyYears)
            {
                WriteObject("last decade");
            }
            else if (elapsedTime.TotalDays >= _twoYears && elapsedTime.TotalDays <= _tenYears)
            {
                int years = (int)(elapsedTime.TotalDays / 365);
                WriteObject($"{years} years ago");
            }
            else if (elapsedTime.TotalDays >= _oneYear && elapsedTime.TotalDays <= _twoYears)
            {
                WriteObject("last year");
            }
            else if (elapsedTime.TotalDays >= _twoMonths && elapsedTime.TotalDays <= _oneYear)
            {
                int months = (int)(elapsedTime.TotalDays / 30);
                WriteObject($"{months} months ago");
            }
            else if (elapsedTime.TotalDays >= _oneMonth && elapsedTime.TotalDays <= _twoMonths)
            {
                WriteObject("last month");
            }
            else if (elapsedTime.TotalDays >= _twoWeeks && elapsedTime.TotalDays <= _oneMonth)
            {
                int weeks = (int)(elapsedTime.TotalDays / 7);
                WriteObject($"{weeks} weeks ago");
            }
            else if (elapsedTime.TotalDays >= _oneWeek && elapsedTime.TotalDays <= _twoWeeks )
            {
                WriteObject("last week");
            }
            else if (elapsedTime.TotalDays >= 1 && elapsedTime.TotalDays <= 2)
            {
                WriteObject("yesterday");
            }
            else if (elapsedTime.TotalDays > 2)
            {
                WriteObject($"{(int)elapsedTime.TotalDays} days ago");
            }
            else if (elapsedTime.TotalHours >= 1 && elapsedTime.TotalHours <= 2)
            {
                WriteObject("1 hour ago");
            }
            else if (elapsedTime.TotalHours > 2)
            {
                WriteObject($"{(int)elapsedTime.TotalHours} hours ago");
            }
            else if (elapsedTime.TotalMinutes >= 1 && elapsedTime.TotalMinutes <= 2)
            {
                WriteObject("1 minute ago");
            }
            else if (elapsedTime.TotalMinutes > 2)
            {
                WriteObject($"{(int)elapsedTime.TotalMinutes} minutes ago");
            }
            else
            {
                WriteObject("just now");
            }
        }
    }
}