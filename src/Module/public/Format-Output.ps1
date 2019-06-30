$Esc = [char]0x1B
$EscPrefix = "$Esc`[0"
$EscPostfix = "$($EscPrefix)m"

function Format-Output {
    param (
        [Parameter( Mandatory, ValueFromPipeline, Position=0 )]
        [Alias( 'Text' )]
        $InputObject,

        $Foreground,
        $Background,

        [switch]
        $Bold,

        [switch]
        $Italic,

        [switch]
        $Underline,

        [switch]
        $AsHashtable
    )

    if ( $PSBoundParameters.Count -eq 1 -and (-not $InputObject -is [Hashtable]) ) {
        return $InputObject
    }

    if ( $AsHashtable ) {
        return @{
            Text = $InputObject.ToString()
            Foreground = $Foreground
            Background = $Background
            Bold = $Bold
            Italic = $Italic
            Underline = $Underline
        }
    }

    if ( $InputObject -is [Hashtable] ) {
        Set-StrictMode -Off
        $Foreground = $InputObject.Foreground
        $Background = $InputObject.Background
        $Bold = $InputObject.Bold
        $Italic = $InputObject.Italic
        $Underline = $InputObject.Underline
        $InputObject = $InputObject.Text
    }

    $modifiers = @()
    $modifiers += $EscPrefix

    if ( $Bold ) {
        $modifiers += GetBoldModifier
    }

    if ( $Italic ) {
        $modifiers += GetItalicModifier
    }

    if ( $Underline ) {
        $modifiers += GetUnderlineModiifer
    }

    if ( $null -ne $Foreground ) {
        ValidateColor $Foreground
        $modifiers += ProcessColor $Foreground Foreground
    }

    if ( $null -ne $Background ) {
        ValidateColor $Background
        $modifiers += ProcessColor $Background Background
    }

    "$($modifiers -join ';')m$InputObject$EscPostfix"
}
