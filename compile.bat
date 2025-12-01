@echo off
REM ======= Einstellungen =======
REM LaTeX-Dateiname ohne Endung:
set "BASENAME=T2000"
set "DIR=C:\Users\herrmannja\Downloads\LaTexT2000Neu\"
set "FILE=%DIR%\%BASENAME%.tex"

REM ======= Prüfung =======
IF NOT EXIST "%FILE%" (
    echo Datei "%FILE%" nicht gefunden.
    exit /b 1
)

REM ======= Kompilierungsschritte =======
echo -----------------------------------------
echo [1/5] LaTeX: Erster Durchlauf ...
pdflatex -interaction=nonstopmode "%FILE%"

echo [2/5] makeglossaries ...
makeglossaries "%BASENAME%"

echo [3/5] biber ...
biber "%BASENAME%"

echo [4/5] LaTeX: Zweiter Durchlauf ...
pdflatex -interaction=nonstopmode "%FILE%"

echo [5/5] LaTeX: Dritter Durchlauf für finale Verzeichnisse ...
pdflatex -interaction=nonstopmode "%FILE%"

REM ======= Fertig =======
IF ERRORLEVEL 1 (
    echo *** Fehler beim Kompilieren. ***
    exit /b 1
) ELSE (
    echo *** Kompilierung erfolgreich abgeschlossen. ***
)

pause


