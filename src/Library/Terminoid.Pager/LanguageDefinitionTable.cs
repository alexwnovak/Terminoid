using System.Collections.Generic;

namespace Terminoid.Pager
{
   internal static class LanguageDefinitionTable
   {
      private static readonly Dictionary<string, string> _table = new Dictionary<string, string>
      {
         [".aspx"] = "ASPX",
         [".c"] = "C",
         [".cpp"] = "C++",
         [".cs"] = "C#",
         [".cob"] = "COBOL",
         [".cbl"] = "COBOL",
         [".f90"] = "Fortran",
         [".f95"] = "Fortran",
         [".f03"] = "Fortran",
         [".hs"] = "Haskell",
         [".lhs"] = "Haskell",
         [".htm"] = "HTML",
         [".html"] = "HTML",
         [".java"] = "Java",
         [".js"] = "JavaScript",
         [".m"] = "Mercury",
         [".il"] = "MSIL",
         [".pas"] = "Pascal",
         [".pp"] = "Pascal",
         [".pl"] = "Perl",
         [".php"] = "PHP",
         [".py"] = "Python",
         [".rb"] = "Ruby",
         [".sql"] = "SQL",
         [".vb"] = "Visual Basic",
         [".bas"] = "Visual Basic",
         [".vbs"] = "VBScript",
         [".xml"] = "XML"
      };

      public static string GetDefinition( string extension )
      {
         if ( _table.TryGetValue( extension.ToLower(), out var definition ) )
         {
            return definition;
         }

         return string.Empty;
      }
   }
}
