Sub Run(ByVal sFile,sParam) 
  Dim shell 
  Set shell = CreateObject("WScript.Shell") 
  shell.Run Chr(34) & sFile & Chr(34) & sParam, 1, false 
  Set shell = Nothing 
End Sub 
'----------------------------------------------------------------------------------------------------
Set object = WScript.CreateObject("WScript.Shell") 
Run "\FileSync\FreeFileSync.exe", "\FileSync\SyncJob.ffs_batch"
