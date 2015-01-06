#define MyAppName "DCM4CHEE INSTALLER"
#define MyAppVersion "2.18.0.3"
#define MyAppPublisher "Gokhan Dilek"
#define MyAppURL "https://github.com/gokhandilek/dcm4chee-installer.git"
;;Tested up to Windows 10
[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
AppId={{A20C45AA-E453-4069-8234-885AC7232C1D}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
;the default directory where the application will be installed. You can modify this depending on your needs.
DefaultDirName=C:\dcm4chee\
DisableDirPage=yes
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir=C:\dcm4chee-files\bin\
OutputBaseFilename=DCM4CHEE-2.18.0-postgresql_x86_x64       
SetupIconFile=C:\dcm4chee-files\icon.ico
Compression=lzma
SolidCompression=yes
WizardImageFile=DCM4CHEE.bmp
[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]                                                                
Source: "C:\dcm4chee-files\ChromeStandaloneSetup.exe"; DestDir: "{app}\apps"; Flags: ignoreversion
Source: "C:\dcm4chee-files\environment.exe"; DestDir: "{app}\apps"; Flags: ignoreversion
Source: "C:\dcm4chee-files\reset.vbs"; DestDir: "{app}\apps"; Flags: ignoreversion
Source: "C:\dcm4chee-files\reset.bat"; DestDir: "{app}\apps"; Flags: ignoreversion
;db scripts
Source: "C:\dcm4chee-files\db-backups.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\dcm4chee-files\db-autobackup-task.bat"; DestDir: "{app}\apps"; Flags: ignoreversion
Source: "C:\dcm4chee-files\DCM4CHEE.bmp"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\dcm4chee-files\dcm4chee-2.18.0-psql.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\dcm4chee-files\dcm4chee-arr-3.0.12-psql.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\dcm4chee-files\icon.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\dcm4chee-files\jdk-7u60-windows-i586.exe"; DestDir: "{app}\JDK"; Flags: ignoreversion
Source: "C:\dcm4chee-files\postgresql-9.3.4-4-windows.exe"; DestDir: "{app}\db"; Flags: ignoreversion
Source: "C:\dcm4chee-files\winfirewall.bat"; DestDir: "{app}\apps"; Flags: ignoreversion
;Source: "C:\dcm4chee-files\startservices.bat"; DestDir: "{app}\apps"; Flags: ignoreversion
Source: "C:\dcm4chee-files\releaseNotes.txt"; DestDir: "{app}"; Flags: ignoreversion

[RUN]
;set the java environment
Filename: "{app}\apps\environment.exe";  StatusMsg: "Preparing your computer"; Parameters: "-a JAVA_HOME %C:\dcm4chee\JDK";   Flags: runascurrentuser runhidden
Filename: "{app}\apps\environment.exe"; StatusMsg: "Preparing your computer"; Parameters: "-a PATH %C:\dcm4chee\JDK";   Flags: runascurrentuser  runhidden
;open ports
Filename: "{app}\apps\winfirewall.bat"; StatusMsg: "Configuring windows firewall for PACS"; Flags: runascurrentuser runhidden
;install preprequsites
;install Chrome web browser for web browser viewers (oviyam & ioviyam). (optional)
Filename: "{app}\apps\ChromeStandaloneSetup.exe";  StatusMsg: "Installing Google Chrome Browser for web viewer";  Flags: runascurrentuser
;install dcm4chee-2.18.0-psql.exe and auditing self extractor.
Filename: "{app}\dcm4chee-2.18.0-psql.exe"; StatusMsg: "Extracting PACS. This may take few minutes...";
Filename: "{app}\dcm4chee-arr-3.0.12-psql.exe"; StatusMsg: "Extracting PACS auditing...";
;Filename: "{app}\apps\httpd-2.2.25-win32-x86-openssl-0.9.8y.msi"; StatusMsg: "Setting up the web server"; Verb: open; Flags: shellexec postinstall waituntilterminated runascurrentuser 
;Install JAva JDK
Filename: "{app}\JDK\jdk-7u60-windows-i586.exe"; StatusMsg: "Installing java virtual machine and application server";
;Refresh windows logon for the settings to take affect 
Filename: "{app}\apps\reset.bat"; StatusMsg: "Preparing your computer";    Flags: runascurrentuser  runhidden
;database installation
Filename: "{app}\db\postgresql-9.3.4-4-windows.exe"; StatusMsg: "Installing database";
Filename: "{app}\db\bin\createdb.exe"; StatusMsg: "Creating database for PACS"; Parameters: "--encoding=UTF8 --username=postgres pacsdatabase";   Flags: runascurrentuser
Filename: "{app}\db\bin\psql.exe"; StatusMsg: "Configuring database"; Parameters: "--file=deploypacs.psql --username=postgres pacsdatabase";   Flags: runascurrentuser
Filename: "{app}\db\bin\createdb.exe"; StatusMsg: "Creating database for PACS auditing"; Parameters: "--encoding=UTF8 --username=postgres pacs-auditing";   Flags: runascurrentuser
Filename: "{app}\db\bin\psql.exe"; StatusMsg: "Configuring database"; Parameters: "--file=dcm4chee-arr-psql.ddl --username=postgres pacs-auditing";   Flags: runascurrentuser
;creating automated database backups schedules                                    
Filename: "{app}\apps\db-autobackup-task.bat"; StatusMsg: "Creating automated database backups";   Flags: runascurrentuser
Filename: "{app}\db-backups.exe"; StatusMsg: "Creating automated database backups";   Flags: runascurrentuser
;creating and start the DCM4CHEE service
Filename: "{app}\dcm4chee-2.18.0-psql\bin\install_service.bat"; StatusMsg: "Deploying DCM4CHEE Archive"; Flags: runascurrentuser
Filename: "{app}\dcm4chee-2.18.0-psql\bin\install_arr.bat";  StatusMsg: "Deploying DCM4CHEE auditing features"; Parameters: "c:\dcm4chee\dcm4chee-arr-3.0.12-psql"; Flags: runascurrentuser
Filename: "{app}\startservices.bat"; StatusMsg: "Starting DCM4CHEE Archive service"; Flags: runascurrentuser
[FILES]
;copy the postgre dump files into db\bin folder 
DestDir: {app}\db\bin; Source:pacsdeploy\*;  Flags: recursesubdirs

[Icons]
;create a shortcut to DCM4CHEE installer splash page
Name: "{commondesktop}\DCM4CHEE"; Filename: "http://127.0.0.1:8080/splash"; WorkingDir: "{app}" ;  IconFilename: "{app}\icon.ico"
;Name: "{app}\startservices"; Filename: "C:\dcm4chee\apps\startservices.bat"; WorkingDir: "{app}\apps" ;  IconFilename: "{app}\icon.ico"
