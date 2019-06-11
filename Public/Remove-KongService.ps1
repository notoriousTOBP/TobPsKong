function Remove-KongService{
    param(
        [parameter(mandatory)][string]$Name
    )
    Test-KongInstance -TestConnection
    try{
        $ServiceId = (Get-KongService -Name $Name).Id
    }catch{
        throw "Getting existing service - $($_.exception.message)"
    }
    try{
        Send-KongRequest -RequestStem "services/$ServiceId" -RequestMethod DELETE
    }catch{
        throw "Error deleting service '$name' - $($_.exception.message)"
    }
    Write-Host -Foreground $KongThemeColour "Success."
}

