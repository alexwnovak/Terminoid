$ItalicFlag = 3
$UnderlineFlag = 4

function Format-Output {
    param (
        $InputObject,
        $Foreground,
        $Background
    )

    New-VTSequence -Text $InputObject -Foreground $Foreground -Background $Background
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
