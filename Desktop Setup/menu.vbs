Option Explicit 
Dim shell, script, command, iE, height, width, html 
Set shell = CreateObject("WScript.Shell") 
Set script = CreateObject("Scripting.Dictionary") 
Set iE = WScript.CreateObject("InternetExplorer.Application", "IE_") 
'--INSTALL-BUTTONS------------------------------------------------------------
script("Full Install - 2007") = "Install_2007.vbs" 
script("Full Install - 2003") = "Install_2003.vbs" 
script("Resident Install") = "Install_Resident.vbs" 
script("Basic Install") = "Install_Basic.vbs"
'--CODE-----------------------------------------------------------------------
iE.navigate "about:blank" 
Do Until iE.ReadyState = 4 
  WScript.sleep 100 
Loop 
height = 60 + (script.Count * 25) : width = 365
iE.document.parentWindow.resizeTo width, height 
iE.document.title = "Welcome to the Computer Setup Wizard" & string(50, Chr(160)) 
iE.addressBar = false : iE.toolBar = false : iE.statusBar = false 
iE.document.body.scroll = "no"
html = "<div align = center>" 
For Each command in script
  html = html & "<button style = 'width: 90%' id = '" & command & "'>" & _ 
    command & "</button><br />" 
Next 
  html = html & "</div>"
  iE.document.body.innerHTML = html 
For Each command in script 
  iE.document.getElementById(command).onClick = GetRef("Click")
Next 
  iE.visible = true : shell.AppActivate iE.document.title 
Do 
  WScript.sleep 100 
Loop 
Sub IE_OnQuit 
  WScript.quit()
End Sub 
Sub Click 
  Dim install, close
    install = script(iE.document.parentWindow.event.srcElement.id) 
  shell.Run """" & install & """", 7, false : iE.visible = false
  iE.visible = false
End Sub 