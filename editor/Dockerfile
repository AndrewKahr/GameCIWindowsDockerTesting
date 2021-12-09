FROM gameci/windows-hub

COPY python c:/scripts/python

RUN python -u c:/scripts/python/modules/install_unity.py

# At this point, it would ideal to from gameci/windows-base to remove the overhead added by the hub

# Enable executing powershell scripts
RUN powershell -Command Set-ExecutionPolicy unrestricted

# Need to enable these services to make Unity happy
# When these were in base, things blew up, not sure why they have to be specifically here
RUN powershell -Command Set-Service 'nlasvc' -StartupType Automatic
RUN powershell -Command Set-Service 'netprofm' -StartupType Automatic
RUN powershell -Command Set-Service 'wmiApSrv' -StartupType Automatic

COPY powershell c:/scripts/powershell

# Trigger the build when the container starts
ENTRYPOINT [ "powershell", "c:/scripts/powershell/bootstrap.ps1" ]
