$script:Calls = 0

function Get-Many( $Values ) {
    @($Values[$script:Calls++])
}
