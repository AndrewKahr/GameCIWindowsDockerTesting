:: Create support directories
mkdir output
mkdir regkeys

:: We get the location of the windows 10 sdk and save it so the container knows where to find it
echo Y| reg export "HKLM\SOFTWARE\WOW6432Node\Microsoft\Microsoft SDKs\Windows\v10.0" ./regkeys/winsdk.reg

:: We mount our project, registry keys, output directory, and the files for VS build tools
:: Assuming default installation locations for VS and Win 10 SDK
docker run -it ^
--mount type=bind,source=%CD%\workspace,target=c:/workspace ^
--mount type=bind,source=%CD%\regkeys,target=c:/regkeys ^
--mount type=bind,source="C:\Program Files (x86)\Microsoft Visual Studio",target="c:\Program Files (x86)\Microsoft Visual Studio" ^
--mount type=bind,source="C:\Program Files (x86)\Windows Kits",target="C:\Program Files (x86)\Windows Kits" ^
--mount type=bind,source="C:\ProgramData\Microsoft\VisualStudio",target="C:\ProgramData\Microsoft\VisualStudio" ^
--rm --env-file ./credentials.env --env-file ./variables.env gameci/windows-editor:uwp
