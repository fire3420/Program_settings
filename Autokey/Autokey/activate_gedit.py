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

getlist = winexists("gedit")

asz_index = store.get_value("asz_index")
if(not asz_index):
    asz_index = 0
    store.set_value("asz_index",0)
if(getlist):
    if(asz_index > len(getlist)-1):
        asz_index = 0
    os.system('wmctrl -i -a '+getlist[asz_index])
    if(asz_index == len(getlist)-1):
        nextind = 0
    else:
        nextind = asz_index+1
    store.set_value("asz_index",nextind)
else:
    os.system('gedit')
