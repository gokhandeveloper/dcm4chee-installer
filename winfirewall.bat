@ECHO OFF

CLS

:: Display a message to the user:
ECHO Setting Windows Firewall ports for DCM4CHEE
ECHO.


netsh advfirewall firewall add rule name="DCM4CHEE8080" dir=in action=allow protocol=TCP localport=8080
netsh advfirewall firewall add rule name="DCM4CHEE8080" dir=out action=allow protocol=TCP localport=8080

netsh advfirewall firewall add rule name="DCM4CHEE8443" dir=in action=allow protocol=TCP localport=8443
netsh advfirewall firewall add rule name="DCM4CHEE8443" dir=out action=allow protocol=TCP localport=8443

netsh advfirewall firewall add rule name="DCM4CHEEHTTPS443" dir=in action=allow protocol=TCP localport=443
netsh advfirewall firewall add rule name="DCM4CHEEHTTPS443" dir=out action=allow protocol=TCP localport=443

netsh advfirewall firewall add rule name="DCM4CHEEPOSTGRE" dir=in action=allow protocol=TCP localport=5432
netsh advfirewall firewall add rule name="DCM4CHEEPOSTGRE" dir=out action=allow protocol=TCP localport=5432

netsh advfirewall firewall add rule name="DCM4CHEEDICOMRECEIVE" dir=in action=allow protocol=TCP localport=11112
netsh advfirewall firewall add rule name="DCM4CHEEDICOMESEND" dir=out action=allow protocol=TCP localport=11112


netsh advfirewall firewall add rule name="DCM4CHEEDICOM" dir=in action=allow protocol=TCP localport=104
netsh advfirewall firewall add rule name="DCM4CHEEDICOM" dir=out action=allow protocol=TCP localport=104

:: Display completion notice:
ECHO Firewall rules have been implemented!

:: Uncomment to view script results:
:: ECHO.
:: PAUSE
EXIT
