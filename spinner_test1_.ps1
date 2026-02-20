@echo off
setlocal enabledelayedexpansion

echo Starting 2-minute test with spinner...
echo.

set "spinchars=|/-\"
set /a duration=120
set /a counter=0

:loop
if !counter! geq !duration! goto done

set /a spinindex=!counter! %% 4
set "spin=!spinchars:~%spinindex%,1!"

set /a elapsed=!counter!
set /a remaining=!duration! - !counter!
set /a percent=(!counter! * 100) / !duration!

REM Carriage return trick for Windows
echo Progress: [!spin!] !elapsed!/!duration! seconds (!percent!%%) - Remaining: !remaining!s     
timeout /t 1 /nobreak >nul
REM Move cursor up one line
echo [1A

set /a counter+=1
goto loop

:done
echo Progress: [DONE] !duration!/!duration! seconds (100%%) - Complete!          
echo.
echo Test Complete! PASS
pause