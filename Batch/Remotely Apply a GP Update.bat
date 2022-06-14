:: http://technet.microsoft.com/en-gb/sysinternals/bb897553.aspx

SET /P PC=What is the PC number?
psexec gpupdate \\%PC%
PAUSE