Sub Run(ByVal sFile,sParam) 
    Dim shell 
    Set shell = CreateObject("WScript.Shell") 
    shell.Run Chr(34) & sFile & Chr(34) & sParam, 1, false 
    Set shell = Nothing 
End Sub 
'-----------------------------RUN-FILE-SYNC-----------------------------------------------------------------------     
Set object = WScript.CreateObject("WScript.Shell") 
strComputerName = object.ExpandEnvironmentStrings("%COMPUTERNAME%") 
 
If strComputerName = "JNL" Then 
  Run "\PortableApps\FileSync\FreeFileSync.exe", "\PortableApps\FileSync\SyncJob.ffs_batch"
End If
'-----------------------------RUN-APPLICATIONS----------------------------------------------------------------------- 
set app1 = Wscript.CreateObject("Wscript.Shell")
  app1.Run ("\PortableApps\SlickRun\sr.exe")
  
set app2 = Wscript.CreateObject("Wscript.Shell")
  app2.Run ("\PortableApps\RocketDock\App\RocketDock.exe")
'-----------------------------RUN-FIREFOX-AND-KEEPASS-----------------------------------------------------------------
dim preRun 
  preRun=MsgBox("Do you want to run these apps?",vbYesNo,"Firefox and Keepass")  
    If preRun = vbYes Then    
        Run  "\PortableApps\FirefoxPortable\FirefoxPortable.exe", ""
        Run  "\PortableApps\KeePassPortable\KeePassPortable.exe", ""   
    End If 