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

getlist = winexists("Google 스프레드시트")

cas_index = store.get_value("cas_index")
if(not cas_index):
    cas_index = 0
    store.set_value("cas_index",0)
if(getlist):
    if(cas_index > len(getlist)-1):
        cas_index = 0
    os.system('wmctrl -i -a '+getlist[cas_index])
    if(cas_index == len(getlist)-1):
        nextind = 0
    else:
        nextind = cas_index+1
    store.set_value("cas_index",nextind)
else:
    os.system('google-chrome --app-id=felcaaldnbdncclmgdcncolpebgiejap --profile-directory=Default')
