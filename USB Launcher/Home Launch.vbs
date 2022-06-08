Sub Run(ByVal sFile,sParam) 
  Dim shell 
  Set shell = CreateObject("WScript.Shell") 
  shell.Run Chr(34) & sFile & Chr(34) & sParam, 1, false 
  Set shell = Nothing 
End Sub 
'----------------------------------------------------------------------------------------------------
Set object = WScript.CreateObject("WScript.Shell") 
strComputerName = object.ExpandEnvironmentStrings("%COMPUTERNAME%") 
 
If strComputerName = "Desktop" Then 
  Run "\PortableApps\FileSync\FreeFileSync.exe", "\PortableApps\FileSync\SyncJob.ffs_batch"

End If
'----------------------------------------------------------------------------------------------------
Set app1 = Wscript.CreateObject("Wscript.Shell")
  app1.Run ("PortableApps\RocketDock\RocketDock.exe")