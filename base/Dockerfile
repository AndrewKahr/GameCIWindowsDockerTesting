# Initially tried with server core with dotnet, however unity doesn't run
# likely because servercore strips much of the support binaries out which
# breaks unity
# https://forum.unity.com/threads/player-with-server-build-silently-fails-on-windows-server-core.898337/
# FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-ltsc2019

# Resorting to full sized windows image however this doesn't run on github due to mismatched versions
# Not sure if that means that the image version is too different or if we can't run windows containers
# on windows server
# FROM mcr.microsoft.com/windows:1909
FROM mcr.microsoft.com/windows:1809
# FROM mcr.microsoft.com/windows/servercore:1909
# FROM mcr.microsoft.com/windows/server:ltsc2022

# Attempts to get AppCompatibility installed on a servercore image as this theoretically will allow
# core images to work. No luck so far
# RUN powershell -Command Set-Service 'wuauserv' -StartupType Automatic
# RUN powershell -command Add-WindowsCapability -Online -Name ServerCore.AppCompatibility~~~~0.0.1.0 -LimitAccess