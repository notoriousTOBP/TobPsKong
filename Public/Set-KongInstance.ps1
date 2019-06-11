function Set-KongInstance{
    param(
        [string]$InstanceUri,
        [string]$ApiKey,
        [string]$ThemeColour = $KongThemeColour
    )
    Set-ThemeColour -ThemeColour $ThemeColour
    if(!$InstanceUri){
        throw "Please provide InstanceUri parameter."
    }
    $global:kongApiKey = $ApiKey
    $global:kongApiUri = $InstanceUri
    $global:kongHeaders = @{
        apikey = $kongApiKey
    }
    Write-Host -NoNewLine "API key saved as "
    Write-Host -NoNewLine -Foreground $KongThemeColour "`$kongApiKey"
    Write-Host -NoNewLine ". Kong host address set to "
    Write-Host -Foreground $KongThemeColour "$kongApiUri"
    Test-KongInstance -TestConnection -Print
}

