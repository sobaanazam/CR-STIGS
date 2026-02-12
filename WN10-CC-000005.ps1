<#
.SYNOPSIS
    This PowerShell script disables camera access from the Windows 10 lock screen to remediate the STIG finding.

.NOTES
    Author          : Sobaan Azam
    LinkedIn        : linkedin.com/in/sobaanazam/
    GitHub          : github.com/sobaanazam
    Date Created    : 2026-02-11
    Last Modified   : 2026-02-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10 (latest)
    PowerShell Ver. : 

.USAGE
    Run in an elevated PowerShell session.
    Example:
    PS C:\> .\remediate_WN10-CC-000005_DisableLockScreenCamera.ps1
#>

# Disable camera from lock screen (policy)
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
New-Item -Path $regPath -Force | Out-Null
New-ItemProperty -Path $regPath -Name "NoLockScreenCamera" -PropertyType DWord -Value 1 -Force | Out-Null

# Verify
Get-ItemProperty -Path $regPath -Name "NoLockScreenCamera"
