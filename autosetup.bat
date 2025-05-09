@echo off
setlocal enabledelayedexpansion

set /p choice=Do you want to (y)install or (n)remove the proxy settings? 

if /i "%choice%"=="n" (
    echo Removing proxy settings...
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /f >nul 2>&1
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /f >nul 2>&1
    netsh winhttp reset proxy
    echo Proxy settings removed.
    goto end
)

if /i "%choice%"=="y" (
    set /p http=Enter HTTP proxy (e.g. 127.0.0.1:8080): 
    set /p https=Enter HTTPS proxy (e.g. 127.0.0.1:8443): 
    set /p socks=Enter SOCKS proxy (not supported natively): 

    echo Setting proxy settings...
    set "proxy=%http%;https=%https%"
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d %proxy% /f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
    netsh winhttp set proxy %http%
    echo Note: SOCKS proxy can't be set system-wide via script on Windows.
    echo Proxy settings applied.
    goto end
)

echo Invalid option.

:end
pause
