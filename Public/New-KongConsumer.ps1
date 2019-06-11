function New-KongConsumer{
    Test-KongInstance -TestConnection
    (Send-KongRequest -RequestStem "consumers" -RequestMethod POST -RequestBody '{"username": "users-api"}').Id
}

