@echo off
rem ============================================
rem  WYSYL NA GITHUB
rem  Wrzuc pliki do tego folderu i kliknij
rem  dwukrotnie ten plik. Wszystko zostanie
rem  wyslane na publiczne repo tej aplikacji.
rem ============================================
chcp 65001 >nul 2>&1
cd /d "%~dp0"

echo Pobieram zmiany z GitHub...
git pull origin main --no-rebase 2>nul

echo Dodaje pliki...
git add -A

git diff --cached --quiet >nul 2>&1
if not errorlevel 1 (
    echo Brak zmian - nic do wyslania.
    goto :koniec
)

echo Wysylam zmiany na GitHub...
git commit -m "Aktualizacja %date% %time%"
git push origin main

if errorlevel 1 (
    echo.
    echo BLAD: Nie udalo sie wyslac. Sprawdz polaczenie z internetem.
    goto :koniec
)

echo.
echo GOTOWE - pliki sa na Twoim koncie GitHub:
echo https://github.com/buteleczka2345/zegar

:koniec
echo.
pause
