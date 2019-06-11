function New-KongRoute{
    param(
        [PSCustomObject]$RouteDetails,
        [switch]$ReturnTemplate
    )
    if($ReturnTemplate){
        return [PSCustomObject]@{
            strip_path        =   ""
            snis              =   ""
            hosts             =   @()
            name              =   ""
            methods           =   @()
            sources           =   null
            preserve_host     =   ""
            regex_priority    =   ""
            service           =   [PSCustomObject]@{
                id  =   ""
            }
            paths             =   @()
            destinations      =   ""
            protocols         =   @("http","https")
            tags              =   ""
        }
    }
    Test-KongInstance -TestConnection
    try{
        $result = Send-KongRequest -RequestStem "routes" -RequestMethod POST -RequestBody $RouteDetails
    }catch{
        throw "Error creating route - $($_.exception.message)"
    }
    Write-Host -Foreground $KongThemeColour "Success."
    return $result.Id
}

