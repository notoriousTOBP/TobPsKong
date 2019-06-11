function Get-KongConfig{
    Test-KongInstance -TestConnection
    return (Send-KongRequest).Configuration
}

