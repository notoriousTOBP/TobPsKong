function Test-KongInstance{
    param(
        [switch]$TestConnection,
        [switch]$Print
    )
    if(!$kongApiUri){
        throw "No Kong admin URL specified. Run Set-KongInstance first."
    }
    if($TestConnection){
        try{
            $KongResponse = Send-KongRequest
        }catch{
            throw "Error connecting to Kong - $($_)"
        }
        if($Print){
            Write-Host -NoNewLine "Connected to Kong v"
            Write-Host -NoNewLine -Foreground $KongThemeColour $KongResponse.version
            Write-Host -NoNewLine " (Lua "
            Write-Host -NoNewLine -Foreground $KongThemeColour $KongResponse.lua_version
            Write-Host -NoNewLine ") on server "
            Write-Host -NoNewLine -Foreground $KongThemeColour $KongResponse.hostname
            Write-Host "."
            Write-Host -Foreground $KongThemeColour "`n`t$($KongResponse.tagline)`n"
        }
    }
}