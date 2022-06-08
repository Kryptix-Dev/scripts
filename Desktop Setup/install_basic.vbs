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
perCom = 0:proBar.Show()
'--ADOBE-INSTALLERS----------------------------------------------------------------------------------
Set adobeReader = WScript.CreateObject("WScript.Shell")
  proBar.setTitle("Step 1 of 5") : proBar.setText("Installing Adobe Reader") : proBar.Update(perCom)
  adobeReader.Run ("Adobe\Reader Installer.exe")
  proBar.setText("Adobe Reader Installed")
  perCom = perCom + 20 : proBar.Update(perCom)
  WScript.sleep 2000
Set adobeFlash = WScript.CreateObject("WScript.Shell")
  proBar.setTitle("Step 2 of 5") : proBar.setText("Installing Adobe Flash Player") : proBar.Update(perCom)
  adobeFlash.Run ("Adobe\Flash.exe")
  proBar.setText("Adobe Flash Player Installed")
  perCom = perCom + 20 : proBar.Update(perCom)
  WScript.sleep 2000
'--DESKTOP-SHORTCUTS---------------------------------------------------------------------------------
proBar.setTitle("Step 3 of 5") : proBar.setText("Adding Desktop Shortcuts") : proBar.Update(perCom)
WScript.sleep 1000
Set internetShortcut1 = CreateObject("Scripting.FileSystemObject")
  internetShortcut1.Copyfile "\Apps\[server]\Desktop Shortcuts\[site] Optimus.url","C:\"
  internetShortcut1.MoveFile "C:\[site] Optimus.url","C:\Documents and Settings\All Users\Desktop\"
Set internetShortcut2 = CreateObject("Scripting.FileSystemObject")
  internetShortcut2.Copyfile "\Apps\[server]\Desktop Shortcuts\[site] Optimus.url","C:\"
  internetShortcut2.MoveFile "C:\[site] Optimus.url","C:\Documents and Settings\All Users\Desktop\"
Set internetShortcut3 = CreateObject("Scripting.FileSystemObject")
  internetShortcut3.Copyfile "\Apps\[server]\Desktop Shortcuts\Optimus Training.url","C:\"
  internetShortcut3.MoveFile "C:\Optimus Training.url","C:\Documents and Settings\All Users\Desktop\"
Set internetShortcut4 = CreateObject("Scripting.FileSystemObject")
  internetShortcut4.Copyfile "\Apps\[server]\Desktop Shortcuts\Silverchair.url","C:\"
  internetShortcut4.MoveFile "C:\Silverchair.url","C:\Documents and Settings\All Users\Desktop\"
Set internetShortcut5 = CreateObject("Scripting.FileSystemObject")
  internetShortcut5.Copyfile "\Apps\[server]\Desktop Shortcuts\Dart Chart.url","C:\"
  internetShortcut5.MoveFile "C:\Dart Chart.url","C:\Documents and Settings\All Users\Desktop\"
Set internetShortcut6 = CreateObject("Scripting.FileSystemObject")
  internetShortcut6.Copyfile "\Apps\[server]\Desktop Shortcuts\Omnicare.url","C:\"
  internetShortcut6.MoveFile "C:\Omnicare.url","C:\Documents and Settings\All Users\Desktop\"
Set adobeShortcut = CreateObject("Scripting.FileSystemObject")
  adobeShortcut.DeleteFile "C:\Documents and Settings\All Users\Desktop\*.lnk"  
proBar.setText("Desktop Shortcuts Added")
perCom = perCom + 20 : proBar.Update(perCom)
WScript.sleep 2000
'--MICROSOFT-APPLICATIONS----------------------------------------------------------------------------
Set iE = WScript.CreateObject("WScript.Shell")
  proBar.setTitle("Step 4 of 5") : proBar.setText("Installing Internet Explorer 7") : proBar.Update(perCom)
  iE.Run ("Microsoft\IE Install.exe")
  proBar.setText("Internet Explorer 7 Installed")
  perCom = perCom + 20 : proBar.Update(perCom)
  WScript.sleep 2000
'--TREND-MICRO---------------------------------------------------------------------------------------
Set trend = WScript.CreateObject("WScript.Shell")
  proBar.setTitle("Step 5 of 5") : proBar.setText("Installing Trend Micro") : proBar.Update(perCom)
  trend.Run ("Trend Install.exe")
  proBar.setText("Trend Micro Installed") : perCom = perCom + 20 : proBar.Update(perCom)
  WScript.sleep 2000
'--INSTALLATION-COMPLETE-----------------------------------------------------------------------------
proBar.setTitle("Step - of 5") : proBar.setText("Installation Complete") : proBar.Update(perCom)
WScript.sleep 1500
proBar.Close()
