# Enter script code
import subprocess
import os

def winexists(target, nontarget):
    getexists = []
    for line in subprocess.check_output(['wmctrl', '-l']).splitlines():
        window_name = line.split(None, 3)[-1].decode()
        if target in window_name and not(nontarget in window_name):
            getexists.append(line.split(None, 3)[0].decode())
    return getexists

getlist = winexists("VSCodium", "Chrome")

as3_index_codium = store.get_value("as3_index_codium")
if(not as3_index_codium):
    as3_index_codium = 0
    store.set_value("as3_index_codium",0)
if as3_index_codium>len(getlist)-1:
    as3_index_codium=0
    store.set_value("as3_index_codium",0)
if(getlist):
    winClass = window.get_active_class()
    if(winClass == 'vscodium.VSCodium'):
        if(as3_index_codium == len(getlist)-1):
            nextind = 0
        else:
            nextind = as3_index_codium+1
    else:
        nextind = as3_index_codium

    os.system('wmctrl -i -a '+getlist[nextind])
    store.set_value("as3_index_codium",nextind)
else:
    os.system('codium')


