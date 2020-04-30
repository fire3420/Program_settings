# Enter script code
# Enter script code
import subprocess
import os
import socket

def winexists(target):
    for line in subprocess.check_output(['wmctrl', '-l']).splitlines():
        window_name = line.split(None, 3)[-1].decode()
        if target in window_name:
            return True
    return False

hostname = socket.gethostname()

if hostname == 'john-B150-HD3':
    Scriptpath = '/home/john/Jungyong/Automation/Software/Pygdocs/Pygdocs_linux/Scripts'
    Pythonpath = '/home/john/anaconda3/envs/pygdocs_linux/bin/python'
elif hostname == 'john-17ZD990-VX50K':
    Scriptpath = '/home/john/Jungyong/Pygdocs_gitlab/Pygdocs_linux/Scripts'
    Pythonpath = '/home/john/anaconda3/envs/pygdocs_linux/bin/python'
elif hostname == 'RTL':
    Scriptpath = '/home/john/Jungyong/Pygdocs_linux/Scripts/'
    Pythonpath = '/home/john/anaconda3/envs/pygdocs_linux/bin/python'
else:
    Scriptpath = '/home/john/Jungyong/Pygdocs_linux/Scripts/'
    Pythonpath = '/home/john/anaconda3/envs/pygdocs_linux/bin/python'


if(winexists("pygdocseditor2")):
    window.activate('pygdocseditor2', switchDesktop=True)
else:
    os.system('cd '+Scriptpath+';'+Pythonpath+' '+Scriptpath+'/qtexp.py')

