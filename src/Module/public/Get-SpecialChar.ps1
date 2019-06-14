function Get-SpecialChar {
    [CmdletBinding()]
    param ( )

    dynamicparam {
        NewDynamicParam -ParameterName 'Type' -Position 0 -Mandatory -Values $script:SpecialCharTable.Keys
    }

    begin {
        $Type = $PSBoundParameters['Type']
    }

    process {
        $script:SpecialCharTable[$Type]
    }
}
