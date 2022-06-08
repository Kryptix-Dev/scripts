ECHO Trend installer must be in same directory as installer script.

msiexec.exe /norestart /passive /i"trend_standalone_2009.msi"

REM Fixing standalone package to connect to server.

\\[server]\ofcscan\admin\utility\ipxfer\ipxfer.exe -m 1 -s [server] -p 8059 -c 52216 -q 1
\\[server]\ofcscan\autopcc.exe
