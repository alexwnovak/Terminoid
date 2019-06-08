using System;
using System.Text.RegularExpressions;
using Highlight.Engines;
using Highlight.Patterns;

namespace Terminoid.Pager
{
   internal class VTEngine : Engine
   {
      protected override string ProcessBlockPatternMatch( Definition definition, BlockPattern pattern, Match match )
      {
         throw new NotImplementedException();
      }

      protected override string ProcessMarkupPatternMatch( Definition definition, MarkupPattern pattern, Match match )
      {
         throw new NotImplementedException();
      }

      protected override string ProcessWordPatternMatch( Definition definition, WordPattern pattern, Match match )
      {
         return VTSequencer.Colorize( match.Value, pattern.Style.Colors );
      }
   }
}
