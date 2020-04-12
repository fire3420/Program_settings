# Enter script code
# Enter script code
import subprocess
import os

def winexists(target):
    for line in subprocess.check_output(['wmctrl', '-l']).splitlines():
        window_name = line.split(None, 3)[-1].decode()
        if target in window_name:
            return True
    return False

Scriptpath = '/home/john/Jungyong/Pygdocs_gitlab/Pygdocs_linux/Scripts'
Pythonpath = '/home/john/anaconda3/envs/pygdocs_linux/bin/python'
if(winexists("pygdocseditor2")):
    window.activate('pygdocseditor2', switchDesktop=True)
else:
    os.system('cd '+Scriptpath+';'+Pythonpath+' '+Scriptpath+'/qtexp.py')

