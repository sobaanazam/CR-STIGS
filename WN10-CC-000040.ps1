<#
.SYNOPSIS
    This PowerShell script disables insecure guest logons to SMB servers to remediate the Windows 10 STIG finding.

.NOTES
    Author          : Sobaan Azam
    LinkedIn        : linkedin.com/in/sobaanazam/
    GitHub          : github.com/sobaanazam
    Date Created    : 2026-02-11
    Last Modified   : 2026-02-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000040

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10 (latest)
    PowerShell Ver. : 

.USAGE
    Run in an elevated PowerShell session.
    Example:
    PS C:\> .\remediate_WN10-CC-000040_DisableInsecureGuestLogons.ps1
#>

# Disable insecure guest logons (policy)
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation"
New-Item -Path $regPath -Force | Out-Null
New-ItemProperty -Path $regPath -Name "AllowInsecureGuestAuth" -PropertyType DWord -Value 0 -Force | Out-Null

# Verify
Get-ItemProperty -Path $regPath -Name "AllowInsecureGuestAuth"
