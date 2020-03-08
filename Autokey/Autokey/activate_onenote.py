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

getlist = winexists("OneNote")

as4_index = store.get_value("as4_index")
if(not as4_index):
    as4_index = 0
    store.set_value("as4_index",0)
if(getlist):
    if(as4_index > len(getlist)-1):
        as4_index = 0
    os.system('wmctrl -i -a '+getlist[as4_index])
    if(as4_index == len(getlist)-1):
        nextind = 0
    else:
        nextind = as4_index+1
    store.set_value("as4_index",nextind)
else:
    os.system('p3x-onenote')

