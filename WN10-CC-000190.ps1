<#
.SYNOPSIS
    This PowerShell script disables AutoPlay for all drives on Windows 10 to remediate the STIG finding.

.NOTES
    Author          : Sobaan Azam
    LinkedIn        : linkedin.com/in/sobaanazam/
    GitHub          : github.com/sobaanazam
    Date Created    : 2026-02-11
    Last Modified   : 2026-02-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000190

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10 (latest)
    PowerShell Ver. : 

.USAGE
    Run in an elevated PowerShell session.
    Example:
    PS C:\> .\remediate_WN10-CC-000190_DisableAutoPlay_AllDrives.ps1
#>

# Disable AutoPlay for all drives (policy)
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
New-Item -Path $regPath -Force | Out-Null
New-ItemProperty -Path $regPath -Name "NoDriveTypeAutoRun" -PropertyType DWord -Value 255 -Force | Out-Null

# Verify
Get-ItemProperty -Path $regPath -Name "NoDriveTypeAutoRun"
