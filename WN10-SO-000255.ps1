<#
.SYNOPSIS
    This PowerShell script configures UAC to automatically deny elevation requests for standard users.

.NOTES
    Author          : Sobaan Azam
    LinkedIn        : linkedin.com/in/sobaanazam/
    GitHub          : github.com/sobaanazam
    Date Created    : 2026-02-11
    Last Modified   : 2026-02-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000255

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10 (latest)
    PowerShell Ver. : 

.USAGE
    Run in an elevated PowerShell session.
    PS C:\> .\remediate_WN10-SO-000255_UAC_StdUserDeny.ps1
#>

$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
New-Item -Path $regPath -Force | Out-Null
New-ItemProperty -Path $regPath -Name "ConsentPromptBehaviorUser" -PropertyType DWord -Value 0 -Force | Out-Null

Get-ItemProperty -Path $regPath -Name "ConsentPromptBehaviorUser"
