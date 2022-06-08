'***************************************************
'** Script to map the appropriate Home Drives ******
'***************************************************
'Declare temporary variables
Dim wsh
Dim tmp
Dim Network
Dim LogonServer

'Assign appropriate objects to variables
set wsh = WScript.CreateObject("Wscript.Shell")
set Network = CreateObject("Wscript.network")

'Get the currect logon server
LogonServer = wsh.ExpandEnvironmentStrings("%LogonServer%")

'Based on what the user's logon server connect to appropriate home drive
select case LogonServer 
 	case "\\bhg-mdfpsrvr30"
		 Network.MapNetworkDrive("H:", "\\technology\mdusers$\" & Network.UserName, true)
		 wscript.echo Network.UserName  & "'s H: Drive successfully connected!"
	case "\\bhg-sgfpsrvr1"
		Network.MapNetworkDrive "H:", "\\technology\sgusers$\" & Network.UserName , true
		wscript.echo Network.UserName  & "'s H: Drive successfully connected!"
	case "\\bhg-dwfpsrvr2"
		Network.MapNetworkDrive "H:", "\\technology\dwusers$\" & Network.UserName , true
		wscript.echo Network.UserName  & "'s H: Drive successfully connected!"
	case else
		Network.MapNetworkDrive "H:", "\\technology\users\" & Network.UserName , true
		wscript.echo Network.UserName  & "'s H: Drive successfully connected!"
end select


'**** End of the Script ****************************