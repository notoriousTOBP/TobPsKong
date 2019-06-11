function Add-KongPlugin{
    param(
        [string]$RouteName,
        [string]$ServiceName,
        [string]$PluginName,
        [PSCustomObject]$PluginConfig
    )
    Test-KongInstance -TestConnection
    if(($RouteName -and $ServiceName) -or (!$RouteName -and !$ServiceName)){
        throw "Please provide either -RouteName or -ServiceName."
    }
    try{
        $pluginObject = Get-KongPlugin -Name $PluginName
    }catch{
        throw "Unable to find a plugin named '$PluginName'."
    }
    if($PluginConfig){
        $PluginConfig.Id = $pluginObject.Id
        $pluginObject = $PluginConfig
    }
    if($RouteName){
        $resourceType   =   "routes"
        try{
            $resourceId     =   (Get-KongRoute -Name $RouteName).Id
        }catch{
            throw "Error looking up route - $($_.exception.message)"
        }
    }elseif($ServiceName){
        $resourceType   =   "services"
        try{
            $resourceId     =   (Get-KongService -Name $ServiceName).Id
        }catch{
            throw "Error looking up service - $($_.exception.message)"
        }
    }
    Send-KongRequest -RequestStem "$resourceType/$resourceId/plugins" -RequestMethod POST -RequestBody $PluginConfig
}

