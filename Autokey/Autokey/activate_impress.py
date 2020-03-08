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

getlist = winexists("LibreOffice Impress")

asc_index = store.get_value("asc_index")
if(not asc_index):
    asc_index = 0
    store.set_value("asc_index",0)
if(getlist):
    if(asc_index > len(getlist)-1):
        asc_index = 0
    os.system('wmctrl -i -a '+getlist[asc_index])
    if(asc_index == len(getlist)-1):
        nextind = 0
    else:
        nextind = asc_index+1
    store.set_value("asc_index",nextind)
else:
    os.system('soffice -impress')
