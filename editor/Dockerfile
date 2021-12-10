FROM gameci/windows-hub
SHELL ["cmd", "/C"]

# TODO: Need to remove the hardcoded versions
# The portion after the & is to change the exit code to 0 if we exited 1 from 
# the installation. Otherwise docker believes there was an error
RUN "C:/Program Files/Unity Hub/Unity Hub.exe" -- --headless install \
                                               --version 2020.3.24f1 \
                                               --changeset 79c78de19888 \
                                               --module windows-il2cpp \
                                               & if %ERRORLEVEL% EQU 1 exit 0

# At this point, it would ideal to from gameci/windows-base to 
# remove the overhead added by the hub

# Enable executing powershell scripts
RUN powershell -Command Set-ExecutionPolicy unrestricted

# Need to enable these services to make Unity happy
# When these were in base, things blew up, not sure why they have to be specifically here
RUN powershell -Command foreach ($service in 'nlasvc', 'netprofm') {"Set-Service $service -StartupType Automatic"}

# Not needed with the dotnet base image
# RUN powershell -Command Set-Service 'wmiApSrv' -StartupType Automatic

COPY powershell c:/scripts/powershell

# Trigger the build when the container starts
ENTRYPOINT [ "powershell", "c:/scripts/powershell/entrypoint.ps1" ]
