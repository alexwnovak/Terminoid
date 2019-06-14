function Reset-SpecialChar {
    [CmdletBinding( SupportsShouldProcess )]
    param ( )

    dynamicparam {
        NewDynamicParam -ParameterName 'Type' -Position 0 -Mandatory -Values $script:SpecialCharTable.Keys
    }

    begin {
        $Type = $PSBoundParameters['Type']
    }

    process {
        if ( $PSCmdlet.ShouldProcess( "Resetting $Type to its default value" ) ) {
            $script:SpecialCharTable[$Type] = $script:DefaultSpecialCharTable[$Type]
        }
    }
}
