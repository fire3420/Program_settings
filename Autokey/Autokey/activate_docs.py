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

getlist = winexists("Google 문서")

cad_index = store.get_value("cad_index")
if(not cad_index):
    cad_index = 0
    store.set_value("cad_index",0)
if(getlist):
    if(cad_index > len(getlist)-1):
        cad_index = 0
    os.system('wmctrl -i -a '+getlist[cad_index])
    if(cad_index == len(getlist)-1):
        nextind = 0
    else:
        nextind = cad_index+1
    store.set_value("cad_index",nextind)
else:
    os.system('google-chrome --app-id=aohghmighlieiainnegkcijnfilokake --profile-directory=Default')
