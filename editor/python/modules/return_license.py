import os
import run_cmd

# TODO: Need to get rid of these hard coded values. Should pull from os.env
return_cmd = [r"C:\Program Files\Unity\Hub\Editor\2020.3.24f1\Editor\Unity.exe", '-batchmode', '-username', os.getenv('UNITY_USER'), 
                '-password', os.getenv('UNITY_PASS'), '-returnlicense', '-quit', '-nographics', '-logfile']


def return_license():
    print(run_cmd.run_cmd(return_cmd))


if __name__ == "__main__":
    return_license()
