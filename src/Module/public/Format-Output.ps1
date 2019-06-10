$Esc = [char]0x1B
$EscPrefix = "$Esc`[0"
$EscPostfix = "$Esc`[0m"

function Format-Output {
    param (
        [Parameter( Mandatory )]
        $Text,

        $Foreground,
        $Background,

        [switch]
        $Bold,

        [switch]
        $Italic,

        [switch]
        $Underline
    )

    if ( $PSBoundParameters.Count -eq 1 ) {
        return $Text
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
        $modifiers += ProcessColor $Foreground Foreground
    }

    if ( $null -ne $Background ) {
        $modifiers += ProcessColor $Background Background
    }

    "$($modifiers -join ';')m$Text$EscPostfix"
}
