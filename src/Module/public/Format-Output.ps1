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
        $modifiers += $BoldFlag
    }

    if ( $Italic ) {
        $modifiers += $ItalicFlag
    }

    if ( $Underline ) {
        $modifiers += $UnderlineFlag
    }

    if ( $null -ne $Foreground ) {
        $modifiers += ProcessColor $Foreground Foreground
    }

    if ( $null -ne $Background ) {
        $modifiers += ProcessColor $Background Background
    }

    "$($modifiers -join ';')m$Text$EscPostfix"
}

function Format-Output2 {
    param (
        [Parameter( ValueFromPipeline )]
        $InputObject,

        $Foreground,
        $Background,

        [switch]
        $Italic,

        [switch]
        $Underline
    )

    begin {
        $e = [char]0x1B
        $modifiers = @()
        $postfix = "$e`[0m"

        if ( $Italic ) {
            $modifiers += $ItalicFlag
        }

        if ( $Underline ) {
            $modifiers += $UnderlineFlag
        }

        if ( $null -ne ($Foreground -as [byte[]]) ) {
            $modifiers += GetAsRgbArray -ColorType Foreground -Rgb $Foreground
        } elseif ( $null -ne ($Foreground -as [ConsoleColor]) ) {
            $modifiers += GetAsConsoleColor -ColorType Foreground -ColorName $Foreground
        }

        if ( $null -ne ($Background -as [byte[]]) ) {
            $modifiers += GetAsRgbArray -ColorType Background -Rgb $Background
        } elseif ( $null -ne ($Background -as [ConsoleColor]) ) {
            $modifiers += GetAsConsoleColor -ColorType Background -ColorName $Background
        }
    }

    process {
        New-VTSequence $Foreground
        return

        if ( !$modifiers ) {
            $InputObject
            return
        }

        $prefix = "$e`[0;$($modifiers -Join ';')m"
        "$prefix$InputObject$postfix"
    }
}
