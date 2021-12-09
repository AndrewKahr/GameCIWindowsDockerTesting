FROM gameci/windows-base


# TODO: Remove these extra dependencies
# Install chocolatey
RUN powershell -Command Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install python to execute hub commands correctly
# On windows the hub commands instantly exit so docker gives up
# and ends the process, but python allows it to finish execution
# TODO: Find a better way to run hub commands without python
RUN choco install python --no-progress -y

# Install unity hub
RUN choco install unity-hub --no-progress -y
