# First we activate Unity
python -u c:/scripts/python/modules/activate_unity.py

# Next we import the registry keys that point Unity to the win 10 sdk
reg import c:\regkeys\winsdk.reg

# Now we register the visual studio installation so Unity can find it
regsvr32 C:\ProgramData\Microsoft\VisualStudio\Setup\x64\Microsoft.VisualStudio.Setup.Configuration.Native.dll

# Now we can build our project
python -u c:/scripts/python/build_project.py

# Finally free the seat for the activated license
python -u c:/scripts/python/modules/return_license.py
