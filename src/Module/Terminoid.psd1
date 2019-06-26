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
   Description       = 'Power up your PowerShell terminal experience!'

   # Minimum version of the Windows PowerShell engine required by this module
   PowerShellVersion = '5.0'

   # Required assemblies
   RequiredAssemblies = @(
      'System.Drawing.dll'
      #'dependencies/Terminoid.dll'
   )

   # Functions to export from this module, for best performance, do not use wildcards and do not
   # delete the entry, use an empty array if there are no functions to export.
   FunctionsToExport = @(
      'Clear-BarSegment',
      'Clear-FormatterTable',
      'Clear-LocationHistory',
      'Disable-TerminoidPrompt',
      'Enable-TerminoidPrompt',
      'Format-ChildItem',
      'Format-Bar',
      'Format-Date',
      'Format-Join',
      'Format-Output',
      'Format-Size',
      'Get-BarSegment',
      'Get-CurrentBranch',
      'Get-FileDetail',
      'Get-LocationHistory',
      'Get-SpecialChar',
      'Hide-Cursor',
      'Pop-BarSegment',
      'Push-BarSegment',
      'Push-Location',
      'Register-ChildItemFormatter',
      'Register-FileDetailReader',
      'Register-PromptHandler',
      'Register-StartHandler',
      'Reset-DefaultFileDetailReader',
      'Reset-DetailReader',
      'Reset-PromptFormatter',
      'Reset-SpecialChar',
      'Reset-StartHandler',
      'Select-FromMany',
      'Set-DefaultFileDetailReader',
      'Set-DefaultStartHandler',
      'Set-Location',
      'Set-PromptFormatter',
      'Set-SpecialChar',
      'Show-Cursor',
      'Start-Item',
      'Test-GitRepoPath',
      'Write-StatusBar'
   )

   # Cmdlets to export from this module, for best performance, do not use wildcards and do not
   # delete the entry, use an empty array if there are no cmdlets to export.
   CmdletsToExport   = @()

   # Variables to export from this module
   VariablesToExport = @()

   # Aliases to export from this module, for best performance, do not use wildcards and do not
   # delete the entry, use an empty array if there are no aliases to export.
   AliasesToExport   = @()

   # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also
   # contain a PSData hashtable with additional module metadata used by PowerShell.
   PrivateData       = @{
      PSData = @{
         # Tags applied to this module. These help with module discovery in online galleries.
         Tags = @(
            'terminoid',
            'terminal'
         )

         # A URL to the license for this module.
         LicenseUri = 'https://github.com/alexwnovak/Terminoid/blob/master/LICENSE'

         # A URL to the main website for this project.
         ProjectUri = 'https://github.com/alexwnovak/Terminoid'

         # A URL to an icon representing this module.
         # IconUri = ''

         # ReleaseNotes of this module
         # ReleaseNotes = ''
      }
   }
}
