<#
.SYNOPSIS
    This PowerShell script configures the default AutoRun behavior to prevent autorun commands.

.NOTES
    Author          : Sobaan Azam
    LinkedIn        : linkedin.com/in/sobaanazam/
    GitHub          : github.com/sobaanazam
    Date Created    : 2026-02-11
    Last Modified   : 2026-02-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000185

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10 (latest)
    PowerShell Ver. : 

.USAGE
    Run in an elevated PowerShell session.
    PS C:\> .\remediate_WN10-CC-000185_NoAutorun.ps1
#>

$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
New-Item -Path $regPath -Force | Out-Null
New-ItemProperty -Path $regPath -Name "NoAutorun" -PropertyType DWord -Value 1 -Force | Out-Null

Get-ItemProperty -Path $regPath -Name "NoAutorun"
