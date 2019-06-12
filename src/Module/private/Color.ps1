function ValidateColorAsRgbArray( $Color ) {
    if ( $Color.Length -ne 3 ) {
        throw 'An RGB color array must have 3 elements between 0 and 255'
    }

    if ( $Color[0] -lt 0 -or $Color[0] -gt 255 ) {
        throw "Red element found to be outside the 0-255 range: $($Color[0])"
    }

    if ( $Color[1] -lt 0 -or $Color[1] -gt 255 ) {
        throw "Green element found to be outside the 0-255 range: $($Color[1])"
    }

    if ( $Color[2] -lt 0 -or $Color[2] -gt 255 ) {
        throw "Blue element found to be outside the 0-255 range: $($Color[2])"
    }
}

function IsHexColor( $Hex ) {
    $hexString = $Hex.ToString()

    $hexString.Length -eq 6 -and $hexString -match '[0-9a-fA-F]{6}'
}

function ValidateColor( $Color ) {
    if ( $Color -is [ConsoleColor] ) {
        return
    }
    
    if ( [Enum]::GetNames( [ConsoleColor] ) -contains $Color ) {
        return
    }
    
    if ( $Color -is [Array] ) {
        ValidateColorAsRgbArray $Color
        return
    }
    
    if ( IsHexColor $Color ) {
        return
    }

    throw "Unable to parse into a ConsoleColor, RGB triplet, or hex color: $Color"
}
