ARG baseImage="gameci/windows-base"
ARG hubImage="gameci/windows-hub"

###########################
#         Builder         #
###########################

FROM $hubImage as Builder

# Install Editor
# The portion after the & is to change the exit code to 0 if we exited 1 from 
# the installation. Otherwise docker believes there was an error
ARG version
ARG changeSet
RUN "C:/Program Files/Unity Hub/Unity Hub.exe" -- --headless install \
                                               --version %version% \
                                               --changeset %changeSet% \
                                               & if %ERRORLEVEL% EQU 1 exit 0

ARG module
RUN IF NOT %module% == "base" ( \
    "C:/Program Files/Unity Hub/Unity Hub.exe" -- --headless install-modules \
                                               --version %version% \
                                               --module %module% \
                                               --childModules \
                                               & if %ERRORLEVEL% EQU 1 exit 0 \
    )

###########################
#          Editor         #
###########################

FROM $baseImage

# Copy the editor from the builder to the final editor image
COPY --from=Builder ["C:/Program Files/Unity/Hub/Editor/", "C:/Program Files/Unity/Hub/Editor/"]

# Need to grab these dependencies that the editor needs to run
COPY --from=Builder C:/windows/system32/MSVCP100.dll \
                    C:/windows/system32/MSVCP120.dll \
                    C:/windows/system32/MSVCR100.dll \
                    C:/windows/system32/MSVCR120.dll \
                    C:/windows/system32/

# Add version to file at editor path
ARG version
RUN echo %version% > "C:/Program Files/Unity/Hub/Editor/%version%/version"

# Need to enable these services to make Unity happy
# When these were in base, things blew up, not sure why they have to be specifically here
RUN powershell -Command foreach ($service in 'nlasvc', 'netprofm') {"Set-Service $service -StartupType Automatic"}

# Not needed with the dotnet base image
# RUN powershell -Command Set-Service 'wmiApSrv' -StartupType Automatic


# TODO: I believe these are to be removed when integrating with gameCI
# Add bootstrap scripts to image
COPY powershell c:/scripts/powershell

# Trigger the build when the container starts
ENTRYPOINT [ "powershell", "c:/scripts/powershell/entrypoint.ps1" ]
