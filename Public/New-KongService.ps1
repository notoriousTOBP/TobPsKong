function New-KongService{
    param(
        [PSCustomObject]$ServiceDetails,
        [switch]$ReturnTemplate
    )
    if($ReturnTemplate){
        return [PSCustomObject]@{
            host              =   ""
            connect_timeout   =   ""
            protocol          =   ""
            name              =   ""
            read_timeout      =   ""
            port              =   ""
            path              =   ""
            retries           =   ""
            write_timeout     =   ""
            tags              =   ""
        }
    }
    Test-KongInstance -TestConnection
    try{
        $result = Send-KongRequest -RequestStem "services" -RequestMethod POST -RequestBody $ServiceDetails
    }catch{
        throw "Error creating service - $($_.exception.message)"
    }
    Write-Host -Foreground $KongThemeColour "Success."
    return $result.Id
}

