from subprocess import Popen, PIPE


def run_cmd(cmd):
    """
    Runs a command via subprocess and prints out the output as it is received
    :param cmd: Command split by spaces into a list 
    """
    assert isinstance(cmd, list)
    with Popen(cmd, stdout=PIPE, bufsize=1, universal_newlines=True) as p:
        for line in p.stdout:
            print(line, end='')  # process line here
        return p.returncode
