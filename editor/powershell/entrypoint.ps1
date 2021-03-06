# First we activate Unity
& "$PSScriptRoot\steps\activate.ps1"

# Next we import the registry keys that point Unity to the win 10 sdk
reg import c:\regkeys\winsdk.reg

# Now we register the visual studio installation so Unity can find it
regsvr32 C:\ProgramData\Microsoft\VisualStudio\Setup\x64\Microsoft.VisualStudio.Setup.Configuration.Native.dll

# Now we can build our project
& "$PSScriptRoot\steps\build.ps1"

# Finally free the seat for the activated license
& "$PSScriptRoot\steps\return_license.ps1"
