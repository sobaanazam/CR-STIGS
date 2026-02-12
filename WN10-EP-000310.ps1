<#
.SYNOPSIS
    This PowerShell script enables Windows 10 Kernel DMA Protection policy by blocking enumeration of external devices that are incompatible with Kernel DMA Protection.

.NOTES
    Author          : Sobaan Azam
    LinkedIn        : linkedin.com/in/sobaanazam/
    GitHub          : github.com/sobaanazam
    Date Created    : 2026-02-11
    Last Modified   : 2026-02-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-EP-000310

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10 (latest)
    PowerShell Ver. : 

.USAGE
    Run in an elevated PowerShell session.
    Example:
    PS C:\> .\remediate_WN10-EP-000310_EnableKernelDMAProtection.ps1
#>

# Enable policy: Enumeration policy for external devices incompatible with Kernel DMA Protection = Block All
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection"
New-Item -Path $regPath -Force | Out-Null
New-ItemProperty -Path $regPath -Name "DeviceEnumerationPolicy" -PropertyType DWord -Value 0 -Force | Out-Null

# Verify
Get-ItemProperty -Path $regPath -Name "DeviceEnumerationPolicy"
