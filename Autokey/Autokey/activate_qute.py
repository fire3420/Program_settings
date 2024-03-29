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

getlist = winexists("qutebrowser")

as1_index = store.get_value("as1_index")
if(not as1_index):
    as1_index = 0
    store.set_value("as1_index",0)
if(getlist):
    if(as1_index > len(getlist)-1):
        as1_index = 0
    os.system('wmctrl -i -a '+getlist[as1_index])
    if(as1_index == len(getlist)-1):
        nextind = 0
    else:
        nextind = as1_index+1
    store.set_value("as1_index",nextind)
else:
    os.system('qutebrowser')
