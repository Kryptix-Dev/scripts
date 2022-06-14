<#  
.SYNOPSIS
    Compiles a report on all files and directories in a restored folder for backup restore testing.
.DESCRIPTION
    The report is used for auditing compliance to show what files and folders were restored
    with a backup test.  Coupled with an email from an employee signing off on the restore, this
    will show the restores are a successful test of the backup software.
.NOTES
    File Name  : BackupRestore_Directory_Report.ps1
    Author     : Kryptix
    Requires   : PowerShell V3
.LINK
    https://community.spiceworks.com/scripts/show/3766
  #>
  
$directory = Read-Host 'Enter directory path restored'
Get-ChildItem -Path $directory -Recurse |
    Select-Object FullName |
    Export-CSV ".\Restore Report $(Get-Date -format 'MM-yyyy').csv" -NoTypeInformation
