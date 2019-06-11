function Set-ThemeColour{
    param(
        [parameter(mandatory)][string]$ThemeColour
    )
    $AvailableColours = [Enum]::GetValues([System.ConsoleColor]) 
    if($ThemeColour -notin $AvailableColours){
        $AvailableColours | %{ 
            Write-Host "$_" -ForegroundColor $_
        }
        throw "$ThemeColour is not a valid System.ConsoleColor."
    }
    $global:KongThemeColour = $ThemeColour
}
# Override the default theme colour by setting KongThemeColour globally in a profile script
if($KongThemeColour){
    Set-ThemeColour -ThemeColour $KongThemeColour
}else{
    Set-ThemeColour -ThemeColour "Magenta"
}