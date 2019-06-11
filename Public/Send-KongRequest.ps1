function Send-KongRequest{
    param(
        [string]$RequestStem,
        [string]$RequestMethod = "GET",
        [PSCustomObject]$RequestBody,
        [string]$RequestBodyRaw
    )
    $ProgressPreference = "SilentlyContinue"
    $WebRequestParams = @{
        Uri         =   "$KongApiUri/$RequestStem" 
        Headers     =   $kongHeaders 
        Method      =   $RequestMethod
        ContentType =   "application/json"
        ErrorAction =   "Stop"
        TimeoutSec  =   3
    }
    if($RequestBodyRaw){
        $RequestBody = $RequestBodyRaw | ConvertFrom-Json
    }
    if($RequestBody){
        $WebRequestParams.Add("Body",$($RequestBody | ConvertTo-Json -Depth 50 -Compress))
    }
    try{
        $response = Invoke-WebRequest @WebRequestParams | ConvertFrom-Json -ea Stop
    }catch{
        throw "Error getting information from Kong - $($_)"
    }
    if($response.data){
        return $response.data
    }else{
        return $response
    }
}