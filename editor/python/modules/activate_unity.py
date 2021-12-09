import os
import run_cmd

activate_cmd = [r"C:\Program Files\Unity\Hub\Editor\2020.3.24f1\Editor\Unity.exe", '-batchmode', '-username', os.getenv('UNITY_USER'), 
                '-password', os.getenv('UNITY_PASS'), '-serial', os.getenv('UNITY_SERIAL'), '-quit', '-nographics', '-logfile']


def activate_unity():
    print(run_cmd.run_cmd(activate_cmd))

if __name__ == "__main__":
    activate_unity()
