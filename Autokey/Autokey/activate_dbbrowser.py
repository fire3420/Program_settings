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

getlist = winexists("DB Browser")

zwin_index = store.get_value("zwin_index")
if(not zwin_index):
    zwin_index = 0
    store.set_value("zwin_index",0)
if(getlist):
    if(zwin_index > len(getlist)-1):
        zwin_index = 0
    os.system('wmctrl -i -a '+getlist[zwin_index])
    if(zwin_index == len(getlist)-1):
        nextind = 0
    else:
        nextind = zwin_index+1
    store.set_value("zwin_index",nextind)
else:
    os.system('sqlitebrowser')
