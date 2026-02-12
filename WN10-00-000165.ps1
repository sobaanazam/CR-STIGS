<#
.SYNOPSIS
    This PowerShell script disables the Server Message Block (SMB) v1 protocol to remediate the Windows 10 STIG finding.

.NOTES
    Author          : Sobaan Azam
    LinkedIn        : linkedin.com/in/sobaanazam/
    GitHub          : github.com/sobaanazam
    Date Created    : 2026-02-11
    Last Modified   : 2026-02-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000165

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10 (latest)
    PowerShell Ver. : 

.USAGE
    Run in an elevated PowerShell session.
    Example:
    PS C:\> .\remediate_WN10-00-000165_Disable-SMBv1.ps1

    A restart is recommended after applying the change.
#>

# Requires Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "This script must be run as Administrator."
    exit 1
}

# Disable SMBv1 Windows feature
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -NoRestart -ErrorAction Stop

# Simple verification output
Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol | Select-Object FeatureName, State

Write-Host "`nSMBv1 has been disabled (feature). Restart the system to ensure the change takes full effect."
