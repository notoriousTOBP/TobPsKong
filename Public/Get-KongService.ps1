function Get-KongService{
    param(
        [string]$Name
    )
    Test-KongInstance -TestConnection
    return Send-KongRequest -RequestStem "services/$Name"
}

