@{
   # Script module or binary module file associated with this manifest.
   RootModule        = 'Terminoid.psm1'

   # Version number of this module.
   ModuleVersion     = '1.0.0'

   # ID used to uniquely identify this module
   GUID              = '8c07253e-548a-4a56-ba02-f6b9741fe9f2'

   # Author of this module
   Author            = 'Alex Novak'

   # Company or vendor of this module
   CompanyName       = 'Alex Novak'

   # Copyright statement for this module
   Copyright         = '(c) 2019 Alex Novak. All rights reserved.'

   # Description of the functionality provided by this module
   Description       = 'Rad up your terminal'

   # Minimum version of the Windows PowerShell engine required by this module
   PowerShellVersion = '5.0'

   # Functions to export from this module, for best performance, do not use wildcards and do not
   # delete the entry, use an empty array if there are no functions to export.
   FunctionsToExport = @(
      'Push-BarSegment'
   )

   # Cmdlets to export from this module, for best performance, do not use wildcards and do not
   # delete the entry, use an empty array if there are no cmdlets to export.
   CmdletsToExport   = @()

   # Variables to export from this module
   VariablesToExport = @(
      'BarSegments'
   )

   # Aliases to export from this module, for best performance, do not use wildcards and do not
   # delete the entry, use an empty array if there are no aliases to export.
   AliasesToExport   = @()

   # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also
   # contain a PSData hashtable with additional module metadata used by PowerShell.
   PrivateData       = @{
      PSData = @{
         # Tags applied to this module. These help with module discovery in online galleries.
         # Tags = @()

         # A URL to the license for this module.
         # LicenseUri = ''

         # A URL to the main website for this project.
         # ProjectUri = ''

         # A URL to an icon representing this module.
         # IconUri = ''

         # ReleaseNotes of this module
         # ReleaseNotes = ''
      }
   }
}
