The fastest way to setup your own DCM4CHEE PACS using PostgreSQL on Windows.
This script combines all the software needed to get dcm4chee up and running on Windows 7+. It automates the instructions below:

http://www.dcm4che.org/confluence/display/ee2/Installation

Includes Windows firewall configuration, automated database backup schedule(twice a day), auditing, browser viewers (weasis 2.0 and ioviyam)
DCM4CHEE version 2.18.0-postgresql
JDK 7.60+
Postgresql 9.3.4
---------------------------------------------
---------------------------------------------
PreInstallation Process
1- Make sure you delete existing dcm4chee installation.
2- Uninstall the existing postgresql database $ delete the folder under Program Files
---------------------------------------------
---------------------------------------------
Installation Process
1- Make sure your windows OS is installed on C drive. If not, please refer to compiling the project and edit the script file & generate the setup file according to your needs.
2- Download the dcm4chee-installer\dcm4chee-2.18.0-psql installer\bin\DCM4CHEE-2.18.0-postgresql_x86_x64.exe & run the dcm4chee-postgresql.exe file $ Accept the risk and click yes.
3- Choose the Java development kit directory to be c:\dcm4chee\jdk(or whatever is set when compiling) otherwise it will not work.
4- Choose the postgresql directory to be c:\dcm4chee\db (or whatever is set when compiling)
5- Choose the postgresql data directory to be c:\dcm4chee\db\data(this is selected automatically once the postgre directory is selected in the previous step#4.
6- Set the password to be "1" without quotes (Only this password will work otherwise you will need to modify c:\dcm4chee\dcm4chee.2.18.0\server\default\deploy\pacs-postgres.xml file)
IMPORTANT!!!!
The password is the crucial part of the installation process. Please remember the password as you will need it in the next step.
7 - Once prompted, enter the password "1" (This will be asked a few times(4) to create the databases(dcm4chee database and the auditing database) as well as the structure of the databases). 
IMPORTANT!!!!
When you type the password "1", it will look like nothing is happening (not typing the password(the cursor will not be moving as you type "1")). Please make sure the prompted window is active by clicking on it first and press "1" only & press ENTER. It will prompt 4 times!

8- Uncheck the stackbuilder and finish the postgresql installation.
9- Finish the dcm4chee installation & restart your computer. Run the DMC4HCEE icon on your desktop 
10- Go to start and type services and enter. Check to make sure DCM4HCEE sercice is up and running. If not right click and start the services
11- If you cannot see the services at all, navigate to c\dcm4chee\dcm4chee-2.18.0\bin\ & run install_service.bat as administrator then repeat the step #10.

---------------------------------------------
---------------------------------------------

Compiling the project with inno
1- Download and install inno @ http://www.jrsoftware.org/isdl.php
2- Create a folder called dcm4chee-files under C drive.
3- Unzip the dcm4chee-files folder from git into dmc4hcee-files
4- Download the following and place them into dmc4hcee-files folder :
Google chrome standalone(needed for web viewers) @ http://www.google.com/chrome/eula.html?system=true&standalone=1
Postgresql 9.3.4 @ http://www.enterprisedb.com/products-services-training/pgdownload#windows
Java JDK 7 @ http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-windows-i586.exe
5- Open & compile the project dcm4chee-2.18.0-psql.iss (it may take up to 1 minute depending on how fast your environment is).
6- The binary file will be in dcm4chee-files\bin folder once done.

Special thanks to http://www.codeproject.com/Articles/12153/SetEnv for enviroment setup
DCM4CHEE website: http://www.dcm4che.org/confluence/display/ee2/Home


