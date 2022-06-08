'--PROGRESS-BAR-CLASS--------------------------------------------------------------------------------
Class ProgressBar
  Private perComplete_
  Private currentStep_
  Private progressBar_
  Private title_
  Private text_
  Private statusBarText_
  Private Sub ProgessBar_Initialize
    perComplete_ = 0
    currentStep_ = 0
    title_ = "Progress"
    text_ = ""
  End Sub
  Public Function setTitle(title)
    title_ = title
  End Function
  Public Function setText(text)
    text_ = text
  End Function
  Public Function Update(perComplete)
    perComplete_ = perComplete
    UpdateProgressBar()
  End Function
  Public Function Show()
    Set progressBar_ = CreateObject("InternetExplorer.Application")
    progressBar_.navigate2 "about:blank"
    progressBar_.width = 315
    progressBar_.height = 40
    progressBar_.toolbar = false
    progressBar_.menubar = false
    progressBar_.statusbar = false
    progressBar_.visible = true
    progressBar_.document.write "<body scroll = no style = 'margin: 0px; padding: 0px'><div style = 'text-align: center'><span name = 'pc' id = 'pc'>0</span></div>"
    progressBar_.document.write "<div id = 'statusbar' name = 'statusbar' style = 'border: 2px solid black; line-height: 10px; height: 10px; color: dark grey'></div>"
    progressBar_.document.write "<div style = 'text-align: center'><span id = 'text' name = 'text'></span></div>"
  End Function
  Public Function Close()
    progressBar_.quit
  End Function
  Private Function UpdateProgressBar()
    If perComplete_ = 0 Then
      statusBarText_ = ""
    End If
    For n = currentStep_ to perComplete_ - 1
      statusBarText_ = statusBarText_ & "|"
      progressBar_.Document.GetElementById("statusbar").InnerHtml = statusBarText_
      progressBar_.Document.title = n & "% Complete : " & title_
      progressBar_.Document.GetElementById("pc").InnerHtml = n & "% Complete : " & title_
      WScript.sleep 10
    Next
      progressBar_.Document.GetElementById("statusbar").InnerHtml = statusBarText_
      progressBar_.Document.title = perComplete_ & "% Complete : " & title_
      progressBar_.Document.GetElementById("pc").InnerHtml = perComplete_ & "% Complete : " & title_
      progressBar_.Document.GetElementById("text").InnerHtml = text_
      currentStep_ = perComplete_
  End Function
End Class
'--SHELL-ATTRIBUTES----------------------------------------------------------------------------------
Sub Run(ByVal sFile,sParam) 
  Dim shell 
  Set shell = CreateObject("WScript.Shell") 
  shell.Run Chr(34) & sFile & Chr(34) & sParam, 1, false 
  Set shell = Nothing 
End Sub 
'--PROGRESS-BAR-INITIALIZE---------------------------------------------------------------------------
Dim proBar 'progress bar
Dim perCom 'percent complete
Set proBar = New ProgressBar
perCom = 0
proBar.Show()
'--ADOBE-INSTALLERS----------------------------------------------------------------------------------
Set adobeReader = wscript.CreateObject("Wscript.Shell")
  proBar.setTitle("Step 1 of 6") : proBar.setText("Installing Adobe Reader") : proBar.Update(perCom)
  adobeReader.Run ("Adobe\Reader Installer.exe")
  proBar.setText("Adobe Reader Installed")
  perCom = perCom + 16.6 : proBar.Update(perCom)
  wscript.sleep 2000
Set adobeFlash = wscript.CreateObject("Wscript.Shell")
  proBar.setTitle("Step 2 of 6") : proBar.setText("Installing Adobe Flash Player") : proBar.Update(perCom)
  adobeFlash.Run ("Adobe\Flash.exe")
  proBar.setText("Adobe Flash Player Installed")
  perCom = perCom + 16.6 : proBar.Update(perCom)
  wscript.sleep 2000
'--DESKTOP-SHORTCUTS---------------------------------------------------------------------------------
Set adobeShortcut = CreateObject("Scripting.FileSystemObject")
  proBar.setTitle("Step 3 of 6") : proBar.setText("Removing Adobe Icons") : proBar.Update(perCom)
  wscript.sleep 1000
  adobeShortcut.DeleteFile "C:\Documents and Settings\All Users\Desktop\*.lnk"
  proBar.setText("Adobe Icons Removed")
  perCom = perCom + 16.6 : proBar.Update(perCom)
  wscript.sleep 2000  
'--MICROSOFT-APPLICATIONS----------------------------------------------------------------------------
Set iE = wscript.CreateObject("Wscript.Shell")
  proBar.setTitle("Step 4 of 6") : proBar.setText("Installing Internet Explorer 7") : proBar.Update(perCom)
  iE.Run ("Microsoft\IE Install.exe")
  proBar.setText("Internet Explorer 7 Installed")
  perCom = perCom + 16.6 : proBar.Update(perCom)
  wscript.sleep 2000
'--OPEN-OFFICE-----------------------------------------------------------------------------------------
Set openOffice = wscript.CreateObject("Wscript.Shell")
  proBar.setTitle("Step 5 of 6") : proBar.setText("Installing Open Office") : proBar.Update(perCom)
  openOffice.Run ("Open Office.exe")
  proBar.setText("Open Office Installed") : perCom = perCom + 16.6 : proBar.Update(perCom)
  wscript.sleep 2000
'--GAMES-----------------------------------------------------------------------------------------------
proBar.setTitle("Step 6 of 6") : proBar.setText("Installing Games") : proBar.Update(perCom)
wscript.sleep 1000
Set freeCell = CreateObject("Scripting.FileSystemObject")
  freeCell.CopyFile "\Programs\Games\Freecell.exe","C:\"
  freeCell.MoveFile "C:\Freecell.exe","C:\Documents and Settings\All Users\Desktop\"
Set hearts = CreateObject("Scripting.FileSystemObject")
  hearts.CopyFile "\Programs\Games\Hearts.exe","C:\"
  hearts.MoveFile "C:\Hearts.exe","C:\Documents and Settings\All Users\Desktop\"
Set mines = CreateObject("Scripting.FileSystemObject")
  mines.CopyFile "\Programs\Games\Mines.exe","C:\"
  mines.MoveFile "C:\Mines.exe","C:\Documents and Settings\All Users\Desktop\"
Set solitare = CreateObject("Scripting.FileSystemObject")
 solitare.CopyFile "\Programs\Games\Solitare.exe","C:\"
 solitare.MoveFile "C:\Solitare.exe","C:\Documents and Settings\All Users\Desktop\"
Set spiderSolitare = CreateObject("Scripting.FileSystemObject")
  spiderSolitare.CopyFile "\Programs\Games\Spider Solitare.exe","C:\"
  spiderSolitare.MoveFile "C:\Spider Solitare.exe","C:\Documents and Settings\All Users\Desktop\"
Set pinball = CreateObject("Scripting.FileSystemObject")
  pinball.CopyFolder "\Programs\Games\Pinball","C:\"
  pinball.MoveFolder "C:\Pinball","C:\Documents and Settings\All Users\"
'--CREATE-PINBALL-SHORTCUT-----------------------------------------------------------------------------
Option Explicit
Dim objShell, objDesktop, objLink
Dim strAppPath
strAppPath = "C:\Documents and Settings\All Users\Pinball\PINBALL.exe"
Set objShell = CreateObject("WScript.Shell")
  objDesktop = objShell.SpecialFolders("Desktop")
Set objLink = objShell.CreateShortcut(objDesktop & "\Pinball.lnk")
  objLink.Description = "Pinball"
  objLink.TargetPath = strAppPath
  objLink.Save
proBar.setText("Games Installed") : perCom = perCom + 17 : proBar.Update(perCom)
wscript.sleep 2000
'--INSTALLATION-COMPLETE-----------------------------------------------------------------------------
proBar.setTitle("Step - of 6") : proBar.setText("Installation Complete") : proBar.Update(perCom)
wscript.sleep 1500
proBar.Close()
