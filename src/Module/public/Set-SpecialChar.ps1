function Set-SpecialChar {
    [CmdletBinding( SupportsShouldProcess )]
    param (
        [Parameter( Mandatory, ValueFromRemainingArguments )]
        $Char
    )

    dynamicparam {
        NewDynamicParam -ParameterName 'Type' -Position 0 -Mandatory -Values $script:SpecialCharTable.Keys
    }

    begin {
        $Type = $PSBoundParameters['Type']
    }

    process {
        if ( $PSCmdlet.ShouldProcess( "Setting $Type to $Char" ) ) {
            $script:SpecialCharTable[$Type] = $Char
        }
    }
}
