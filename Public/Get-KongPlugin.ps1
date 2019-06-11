function Get-KongPlugin{
    param(
        [string]$Name
    )
    Test-KongInstance -TestConnection
    return Send-KongRequest -RequestStem "plugins/$Name"
}

