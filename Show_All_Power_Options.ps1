Set-Location -Path HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\
Get-ChildItem -Path . -Depth 2 -Include "*-*-*-*-*" -Exclude "DefaultPowerSchemeValues" | ForEach-Object { 
    if (($_.PSIsContainer) -and ($_.PSChildName.Length -eq 36)) {
        New-ItemProperty -Path $_.PSPath -Name Attributes -PropertyType DWord -Value 2 -Force
    }
}