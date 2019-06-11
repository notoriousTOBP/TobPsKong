function Get-KongRoute{
    param(
        [string]$Name
    )
    Test-KongInstance -TestConnection
    return Send-KongRequest -RequestStem "routes/$Name"
}

