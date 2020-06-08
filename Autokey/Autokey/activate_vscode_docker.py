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

getlist = winexists("Visual Studio Code", ["Insider"], "appuser")

as3_index_docker = store.get_value("as3_index_docker")
if(not as3_index_docker):
    as3_index_docker = 0
    store.set_value("as3_index_docker",0)
if as3_index_docker>len(getlist)-1:
    as3_index_docker=0
    store.set_value("as3_index_docker",0)
if(getlist):
    winClass = window.get_active_class()
    if(winClass == 'code.Code'):
        if(as3_index_docker == len(getlist)-1):
            nextind = 0
        else:
            nextind = as3_index_docker+1
    else:
        nextind = as3_index_docker

    os.system('wmctrl -i -a '+getlist[nextind])
    store.set_value("as3_index_docker",nextind)
else:
    os.system('code')


