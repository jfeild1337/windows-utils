@echo off

:: Creates a symlink to a JRE or JDK installation. Useful if
:: you upgrade Java a lot and get tired of having to update your
:: JAVA_HOME and PATH variables.
:: The symlink will be called 'jre_latest' or 'jdk_latest', and you
:: can set your environment variables to point to these instead of the
:: actual JRE/JDK installations. You will need to execute this script from
:: an elevated command prompt in ordre for it to work.

SET "JAVA_BASEDIR=C:\Program Files\Java"

SET NEWLINE=^& echo

SET "JAVA_TYPE=%1"
SET "SYMLINK_NAME=%JAVA_TYPE%_latest"

SET "USAGE=java_symlink.bat jdk|jre X.Y.Z_AB %NEWLINE%    where "X.Y.Z_AB is the JRE/JDK version, i.e., 1.8.0_61"
IF [%2]==[] (
   ECHO INVALID SYNTAX
   ECHO USAGE: %USAGE%
   EXIT
)

SET "JAVA_INSTALLATION=%JAVA_TYPE%%2"
ECHO Creating symlink: %JAVA_BASEDIR%\%SYMLINK_NAME% ---> %JAVA_BASEDIR%\%JAVA_INSTALLATION%

IF EXIST "%JAVA_BASEDIR%\%SYMLINK_NAME%" (
    ECHO Removing old symlink
	RMDIR "%JAVA_BASEDIR%\%SYMLINK_NAME%"
)

mklink /J "%JAVA_BASEDIR%\%SYMLINK_NAME%" "%JAVA_BASEDIR%\%JAVA_INSTALLATION%" 

