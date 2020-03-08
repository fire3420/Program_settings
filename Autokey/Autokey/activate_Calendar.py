# Enter script code
import subprocess
import os

def winexists(target):
    getexists = []
    for line in subprocess.check_output(['wmctrl', '-l']).splitlines():
        window_name = line.split(None, 3)[-1].decode()
        if target in window_name:
            getexists.append(line.split(None, 3)[0].decode())
    return getexists

getlist = winexists("Google 캘린더")

caa_index = store.get_value("caa_index")
if(not caa_index):
    caa_index = 0
    store.set_value("caa_index",0)
if(getlist):
    if(caa_index > len(getlist)-1):
        caa_index = 0
    os.system('wmctrl -i -a '+getlist[caa_index])
    if(caa_index == len(getlist)-1):
        nextind = 0
    else:
        nextind = caa_index+1
    store.set_value("caa_index",nextind)
else:
    os.system('google-chrome --app-id=mpcfcjbgjnllfbbdbhckaknbjjibaldf --profile-directory=Default')
