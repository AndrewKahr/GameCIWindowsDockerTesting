import modules.run_cmd as run_cmd

# TODO: Need to get rid of these hard coded values. Should pull from os.env
build_cmd = [r"C:\Program Files\Unity\Hub\Editor\2020.3.24f1\Editor\Unity.exe", '-quit', '-batchmode', '-projectPath', 'c:/workspace', 
             '-executeMethod', "UnityBuilderAction.Builder.BuildProject", '-buildTarget', 'StandaloneWindows64',
             '-customBuildTarget', 'StandaloneWindows64', '-customBuildPath', "c:/output/output.exe", "-buildVersion", "v1.0.0",  
             "-androidVersionCode", "1", '-nographics']


run_cmd.run_cmd(build_cmd)
