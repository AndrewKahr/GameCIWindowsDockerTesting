import run_cmd

# TODO: Need to get rid of these hard coded values. Should pull from os.env
install_cmd = ["C:/Program Files/Unity Hub/Unity Hub.exe", '--', '--headless',  'install', '--version',  '2020.3.24f1',
               '--changeset',  '79c78de19888', '--module', 'windows-il2cpp']


def install_unity():
    run_cmd.run_cmd(install_cmd)


if __name__ == "__main__":
    install_unity()
