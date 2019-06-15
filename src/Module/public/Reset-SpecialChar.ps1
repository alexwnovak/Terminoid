function Reset-SpecialChar {
    [CmdletBinding( SupportsShouldProcess, ConfirmImpact='High' )]
    param (
        [switch]
        $Force
    )

    dynamicparam {
        NewDynamicParam -ParameterName 'Type' -Position 0 -Values $script:SpecialCharTable.Keys
    }

    begin {
        $Type = $PSBoundParameters['Type']
    }

    process {
        if ( -not $Force ) {
            $types = if ( $Type ) { $Type } else { 'all characters' }

            if ( -not $PSCmdlet.ShouldProcess( "Resetting $types to its default value" ) ) {
                return
            }
        }

        if ( $Type ) {
            $script:SpecialCharTable[$Type] = $script:DefaultSpecialCharTable[$Type]
        } else {
            $script:SpecialCharTable = $script:DefaultSpecialCharTable.Clone()
        }
    }
}
