<#
.SYNOPSIS
    This PowerShell script configures the Windows 10 account lockout duration to 15 minutes or greater to remediate the STIG finding.

.NOTES
    Author          : Sobaan Azam
    LinkedIn        : linkedin.com/in/sobaanazam/
    GitHub          : github.com/sobaanazam
    Date Created    : 2026-02-12
    Last Modified   : 2026-02-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10 (latest)
    PowerShell Ver. : 

.USAGE
    Run in an elevated PowerShell session.
    Example:
    PS C:\> .\remediate_WN10-AC-000005_LockoutDuration.ps1
#>

# Set account lockout duration to 15 minutes
net accounts /lockoutduration:15 | Out-Null

# Verify (shows current account policy settings)
net accounts
