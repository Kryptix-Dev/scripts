Dim PCName	
							
InputPCName
PingComputer(PCName)
FindCurrentLoggedIn(PCName)
'==================================================================================						
'Procedures						

Sub InputPCName()						

PCName = InputBox("Please enter a PC Name or IP Address you need the currently logged on user" , "PC Name", , 100, 100)
If PCName = "" Then    ' Canceled by the user
    	Msgbox "User input canceled", vbokonly, "Canceled"
	wscript.quit	
Else 
End If

End Sub						

'**************************************************************************************************************							
Sub PingComputer(PCName)

Set WshShell = CreateObject("WScript.Shell")
PINGFlag = Not CBool(WshShell.run("ping -n 1 " & PCName,0,True))

If PINGFlag = True Then
Else
	MsgBox "The computer was not on the network to check", vbOKOnly , "PC not on Lan"
	WScript.Quit 
End If

End Sub

'**************************************************************************************************************							

Sub FindCurrentLoggedIn(PCName)

Set objWMIService = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\" & PCName & "\root\cimv2") 
Set colProcessList = objWMIService.ExecQuery("Select * from Win32_Process Where Name = 'explorer.exe'")

'finds the current user
For Each objProcess in colProcessList
      objProcess.GetOwner strUserName, strUserDomain
Next

If strusername = "" Then 
	MsgBox "NO ONE is currently logged on" , vbOKOnly , "Currently logged on"
Else 
	MsgBox strUserDomain & "\" & strUserName & " is currently logged on.", vbOKOnly , "Currently logged on"
End If 

End Sub