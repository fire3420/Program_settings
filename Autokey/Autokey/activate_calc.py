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

getlist = winexists("LibreOffice Calc")

asv_index = store.get_value("asv_index")
if(not asv_index):
    asv_index = 0
    store.set_value("asv_index",0)
if(getlist):
    if(asv_index > len(getlist)-1):
        asv_index = 0
    os.system('wmctrl -i -a '+getlist[asv_index])
    if(asv_index == len(getlist)-1):
        nextind = 0
    else:
        nextind = asv_index+1
    store.set_value("asv_index",nextind)
else:
    os.system('soffice -calc')
