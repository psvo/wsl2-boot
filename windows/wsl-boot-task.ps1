<#
.SYNOPSIS
  Task script to boot WSL2 machine with fixed IP.
.DESCRIPTION
  - Invoke wsl-boot.ps1 with required paramters.
  - Log wsl-boot.ps1 command output to log file.
.NOTES
  - This script must Run As Administrator from a Windows PowerShell prompt,
    or from the bat file executed with elevated permission (Run As Administrator).
  - Invoke as: 'pwsh -Command %WSL2_BOOT%\windows\wsl-boot-task.ps1'
.LINK
  https://github.com/psvo/wsl2-boot
#>

$logPath = "$env:USERPROFILE\wsl-boot.log"
Write-Host "Logging to $logPath"
&"$env:WSL2_BOOT\windows\wsl-boot" -WslSubnetPrefix "192.168.254" *>&1 | Tee-Object -FilePath $logPath
Start-Sleep -Seconds 5
