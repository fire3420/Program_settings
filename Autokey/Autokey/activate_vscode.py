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

getlist = winexists("Visual Studio Code")

as3_index = store.get_value("as3_index")
if(not as3_index):
    as3_index = 0
    store.set_value("as3_index",0)
if(getlist):
    winClass = window.get_active_class()
    if(winClass == 'code.Code'):
        if(as3_index == len(getlist)-1):
            nextind = 0
        else:
            nextind = as3_index+1
    else:
        nextind = as3_index

    os.system('wmctrl -i -a '+getlist[nextind])
    store.set_value("as3_index",nextind)
else:
    os.system('code')
