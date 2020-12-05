# Enter script code
import subprocess
import os
import socket

def winexists(target, nontarget, hostname=socket.gethostname()):
    getexists = []
    for line in subprocess.check_output(['wmctrl', '-l']).splitlines():
        window_name = line.split(None, 3)[-1].decode()
        window_host = line.split(None, 3)[2].decode()
        if target in window_name and hostname in window_host:
            check_app = True
            for ni in nontarget:
                if ni in window_name:
                    check_app = False
            if check_app:
                getexists.append(line.split(None, 3)[0].decode())
    return getexists

getlist = winexists("Microsoft​ Edge Dev", ["Chrome"])

as3_index_insiders = store.get_value("as3_index_insiders")
if(not as3_index_insiders):
    as3_index_insiders = 0
    store.set_value("as3_index_insiders",0)
if as3_index_insiders>len(getlist)-1:
    as3_index_insiders=0
    store.set_value("as3_index_insiders",0)
if(getlist):
    winClass = window.get_active_class()
    if(winClass == 'code - insiders.Code - Insiders'):
        if(as3_index_insiders == len(getlist)-1):
            nextind = 0
        else:
            nextind = as3_index_insiders+1
    else:
        nextind = as3_index_insiders

    os.system('wmctrl -i -a '+getlist[nextind])
    store.set_value("as3_index_insiders",nextind)
else:
    os.system('code-insiders')


