# GameCI Windows Docker Testing

Testing windows based docker containers to build il2cpp windows unity projects.

The images are currently very large, roughly 20gb.

# Usage

1. Make sure docker is configured for **Windows** containers.

2. Run `build.bat` to build and tag each docker image.

3. You will need to create a `credentials.env` file at the base of the repo such 
   that it is structured as the following:  
`UNITY_USER=<Unity_User_Name>`  
`UNITY_PASS=<Unity_Password>`  
`UNITY_SERIAL=<Unity_Serial_Number>`

4. Ensure the host has Visual Studio 2019 installed with the C++ workload and a 
Windows 10 SDK in the default installation locations. This is what the container 
will use to build the project.

5. Run `run.bat` to generate the appropriate registry keys, support folders, 
and run the editor container with the correct command line switches.

# Structure

- `Base`: Holds the dockerfile that builds the base image that is used by the hub
          and editor
- `Hub`: Uses the base image to install Unity Hub
- `Editor`: Uses the hub image to install a unity editor. Also includes python 
            scripts to perform various operations to install the editor, activate unity, build the project, and release the license.
- `test-project`: Holds a basic test project configured to build as il2cpp, .Net 
                  4.X, for Unity 2020.3.24f1.
- `build.bat`: Builds the docker containers for this repo
- `run.bat`: Runs the built docker container with the command line switches to 
             mount all necessary directories into the container.