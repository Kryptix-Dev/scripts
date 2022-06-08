Sub Run(ByVal sFile,sParam) 
  Dim shell 
  Set shell = CreateObject("WScript.Shell") 
  shell.Run Chr(34) & sFile & Chr(34) & sParam, 1, false 
  Set shell = Nothing 
End Sub 
'----------------------------------------------------------------------------------------------------
Set object = WScript.CreateObject("WScript.Shell") 
strComputerName = object.ExpandEnvironmentStrings("%COMPUTERNAME%") 
 
If strComputerName = "[name]" Then 
  Run "\Apps\FileSync\FreeFileSync.exe", "\Apps\FileSync\SyncJob.ffs_batch"
Else
  dim preRun 
  preRun = MsgBox("Do you want to run the wizard?",vbYesNo,"Computer Setup Wizard")  
  If preRun = vbYes Then    
      Run  "\Apps\[folder]\Install Menu.exe", ""  
  End If
End If
'----------------------------------------------------------------------------------------------------
Set app1 = Wscript.CreateObject("Wscript.Shell")
  app1.Run ("\Apps\PStart.exe")
