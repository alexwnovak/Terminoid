using Highlight.Patterns;

namespace Terminoid.Pager
{
   internal static class VTSequencer
   {
      private const string _prefix = "\x1b[38;2;{0};{1};{2}m";
      private const string _suffix = "\x1b[0m";

      public static string Colorize( string input, ColorPair colors )
      {
         string foreground = string.Format( _prefix, colors.ForeColor.R, colors.ForeColor.G, colors.ForeColor.B );

         return $"{foreground}{input}{_suffix}";
      }
   }
}
