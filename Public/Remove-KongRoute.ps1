function Remove-KongRoute{
    param(
        [parameter(mandatory)][string]$Name
    )
    Test-KongInstance -TestConnection
    try{
        $routeId = (Get-KongRoute -Name $Name).Id
    }catch{
        throw "Getting existing route - $($_.exception.message)"
    }
    try{
        Send-KongRequest -RequestStem "routes/$routeId" -RequestMethod DELETE
    }catch{
        throw "Error deleting route '$name' - $($_.exception.message)"
    }
    Write-Host -Foreground $KongThemeColour "Success."
}

