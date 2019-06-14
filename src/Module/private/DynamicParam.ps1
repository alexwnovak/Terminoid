function NewDynamicParam {
    param (
        [string]
        $ParameterName,

        [int]
        $Position,

        [switch]
        $Mandatory,

        $Values
    )

    $parameterAttribute = New-Object System.Management.Automation.ParameterAttribute
    $parameterAttribute.Mandatory = $Mandatory

    if ( $PSBoundParameters.ContainsKey( 'Position' ) ) {
        $parameterAttribute.Position = $Position
    }

    $attributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
    $attributeCollection.Add( $parameterAttribute )

    $validateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute( $Values )
    $attributeCollection.Add( $validateSetAttribute )

    $runtimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter( $ParameterName, [string], $attributeCollection )

    $runtimeParameterDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
    $runtimeParameterDictionary.Add( $parameterName, $runtimeParameter )

    return $runtimeParameterDictionary
}
