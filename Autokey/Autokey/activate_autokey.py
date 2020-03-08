# Enter script code
import subprocess
import os

def winexists(target):
    for line in subprocess.check_output(['wmctrl', '-l']).splitlines():
        window_name = line.split(None, 3)[-1].decode()
        if target in window_name:
            return True
    return False
    
if(winexists("AutoKey")):
    window.activate('autokey-gtk.Autokey-gtk', switchDesktop=True, matchClass=True)
else:
    os.system("AutoKey")
